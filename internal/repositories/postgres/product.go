package postgres

import (
	"context"
	"github.com/LorezV/shopiest.git/internal/domain"
	"github.com/jackc/pgx/v5"
)

type ProductRepository struct {
	postgres *Postgres
}

func NewProductRepository(postgres *Postgres) *ProductRepository {
	return &ProductRepository{
		postgres: postgres,
	}
}

func (r *ProductRepository) Create(ctx context.Context, name string, description *string, price int) (*domain.Product, error) {
	row := r.postgres.conn.QueryRow(
		ctx,
		`INSERT INTO public."product"(name, description, price) VALUES ($1, $2, $3) RETURNING *;`,
		name,
		description,
		price,
	)

	return ToDomainProduct(row)
}

func (r *ProductRepository) FindByID(ctx context.Context, id int) (*domain.Product, error) {
	row := r.postgres.conn.QueryRow(
		ctx,
		`SELECT * FROM public."product" WHERE id=$1;`,
		id,
	)

	return ToDomainProduct(row)
}

func (r *ProductRepository) FindAll(ctx context.Context) ([]*domain.Product, error) {
	rows, err := r.postgres.conn.Query(ctx, `SELECT * FROM public."product";`)

	if err != nil {
		return nil, err
	}

	if rows.Err() != nil {
		return nil, err
	}

	products := make([]*domain.Product, 0)

	for rows.Next() {
		product, err := ToDomainProduct(rows)

		if err != nil {
			return nil, err
		}

		products = append(products, product)
	}

	return products, nil
}

func ToDomainProduct(row pgx.Row) (*domain.Product, error) {
	var product domain.Product

	err := row.Scan(
		&product.ID,
		&product.Name,
		&product.Description,
		&product.Price,
		&product.CreatedAt,
		&product.UpdatedAt,
		&product.DeletedAt,
	)

	if err != nil {
		return nil, err
	}

	return &product, nil
}
