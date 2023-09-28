package services

import (
	"context"
	"github.com/LorezV/shopiest.git/internal/domain"
	"github.com/LorezV/shopiest.git/internal/repositories"
)

type UserService struct {
	repositories *repositories.Manager
}

func NewUserService(userRepository *repositories.Manager) *UserService {
	return &UserService{
		repositories: userRepository,
	}
}

func (s *UserService) GetUser(ctx context.Context, id int) (*domain.User, error) {
	return s.repositories.UserRepository.FindByID(ctx, id)
}
