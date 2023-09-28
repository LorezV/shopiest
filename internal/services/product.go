package services

import (
	"context"
	"github.com/LorezV/shopiest.git/internal/domain"
	"github.com/LorezV/shopiest.git/internal/repositories"
)

type ProductService struct {
	repositories *repositories.Manager
}

func NewProductService(repositories *repositories.Manager) *ProductService {
	return &ProductService{
		repositories,
	}
}

func (s *ProductService) GetProductPublic(ctx context.Context, id int) (*domain.Product, error) {
	return s.repositories.ProductRepository.FindByID(ctx, id)
}

func (s *ProductService) FindAll(ctx context.Context) ([]*domain.Product, error) {
	return s.repositories.ProductRepository.FindAll(ctx)
}
