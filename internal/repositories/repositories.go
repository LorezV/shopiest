package repositories

import (
	"context"
	"github.com/LorezV/shopiest.git/internal/domain"
)

type Manager struct {
	UserRepository    UserRepository
	ProductRepository ProductRepository
}

func NewManager(
	user UserRepository,
	product ProductRepository,
) *Manager {
	return &Manager{
		user,
		product,
	}
}

type ProductRepository interface {
	Create(ctx context.Context, name string, description *string, price int) (*domain.Product, error)
	FindByID(ctx context.Context, id int) (*domain.Product, error)
	FindAll(ctx context.Context) ([]*domain.Product, error)
}

type UserRepository interface {
	FindByID(ctx context.Context, id int) (*domain.User, error)
	FindByEmail(ctx context.Context, email string) (*domain.User, error)
	Create(ctx context.Context, email string, password string) (*domain.User, error)
	ChangePassword(ctx context.Context, id int, password string) (*domain.User, error)
}
