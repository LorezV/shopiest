package postgres

import (
	"context"
	"github.com/LorezV/shopiest.git/internal/domain"
	"github.com/jackc/pgx/v5"
)

type UserRepository struct {
	postgres *Postgres
}

func NewUserRepository(postgres *Postgres) *UserRepository {
	return &UserRepository{
		postgres: postgres,
	}
}

func (r *UserRepository) FindByID(ctx context.Context, id int) (*domain.User, error) {
	row := r.postgres.conn.QueryRow(
		ctx,
		`SELECT * FROM public."user" WHERE id=$1`,
		id,
	)

	return ToDomainUser(row)
}

func (r *UserRepository) FindByEmail(ctx context.Context, email string) (*domain.User, error) {
	row := r.postgres.conn.QueryRow(
		ctx,
		`SELECT * FROM public."user" WHERE email=$1`,
		email,
	)

	return ToDomainUser(row)
}

func (r *UserRepository) Create(ctx context.Context, email string, password string) (*domain.User, error) {
	row := r.postgres.conn.QueryRow(
		ctx,
		`INSERT INTO public."user"(email, password) VALUES ($1, $2) RETURNING *;`,
		email,
		password,
	)

	return ToDomainUser(row)
}

func (r *UserRepository) ChangePassword(ctx context.Context, id int, password string) (*domain.User, error) {
	row := r.postgres.conn.QueryRow(
		ctx,
		`UPDATE public."user" SET password = $2 WHERE public."user".id = $1 RETURNING *;`,
		id,
		password,
	)

	return ToDomainUser(row)
}

func ToDomainUser(row pgx.Row) (*domain.User, error) {
	var user domain.User

	err := row.Scan(
		&user.ID,
		&user.Email,
		&user.Password,
		&user.CreatedAt,
		&user.UpdatedAt,
		&user.DeletedAt,
	)

	if err != nil {
		return nil, err
	}

	return &user, nil
}
