package services

import (
	"context"
	"fmt"
	"github.com/LorezV/shopiest.git/internal/config"
	"github.com/LorezV/shopiest.git/internal/domain"
	"github.com/LorezV/shopiest.git/internal/repositories"
	"github.com/golang-jwt/jwt/v5"
	"golang.org/x/crypto/bcrypt"
	"time"
)

type AuthService struct {
	repositories *repositories.Manager
	config       *config.Config
}

func NewAuthService(repositories *repositories.Manager, appConfig *config.Config) *AuthService {
	return &AuthService{
		repositories,
		appConfig,
	}
}

func (s *AuthService) Authorize(ctx context.Context, token string) (*domain.User, error) {
	jwtToken, err := jwt.Parse(token, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("unexpected signing method: %v", token.Header["alg"])
		}

		return []byte(s.config.JwtAccessSecret), nil
	})

	if err == nil {
		if claims, ok := jwtToken.Claims.(jwt.MapClaims); ok && jwtToken.Valid {
			user, err := s.repositories.UserRepository.FindByID(ctx, int(claims["user_id"].(float64)))
			if err != nil {
				return nil, err
			}

			return user, nil
		}
	}

	return nil, err
}

func (s *AuthService) Refresh(ctx context.Context, token string) (*GenerateTokensResult, error) {
	jwtToken, err := jwt.Parse(token, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("unexpected signing method: %v", token.Header["alg"])
		}

		return []byte(s.config.JwtRefreshSecret), nil
	})

	if err == nil {
		if claims, ok := jwtToken.Claims.(jwt.MapClaims); ok && jwtToken.Valid {
			user, err := s.repositories.UserRepository.FindByID(ctx, int(claims["user_id"].(float64)))
			if err != nil {
				return nil, err
			}

			return s.generateTokens(user.ID)
		}
	}

	return nil, err
}

func (s *AuthService) Login(ctx context.Context, dto *domain.LoginDto) (*GenerateTokensResult, error) {
	err := dto.Validate()
	if err != nil {
		return nil, err
	}

	user, err := s.repositories.UserRepository.FindByEmail(ctx, dto.Email)
	if err != nil {
		return nil, err
	}

	err = bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(dto.Password))
	if err != nil {
		return nil, err
	}

	return s.generateTokens(user.ID)
}

func (s *AuthService) Register(ctx context.Context, dto *domain.RegistrationDto) (*GenerateTokensResult, error) {
	err := dto.Validate()
	if err != nil {
		return nil, err
	}

	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(dto.Password), 14)
	if err != nil {
		return nil, err
	}

	dto.Password = string(hashedPassword)

	user, err := s.repositories.UserRepository.Create(ctx, dto.Email, dto.Password)

	if err != nil {
		return nil, err
	}

	return s.generateTokens(user.ID)
}

type GenerateTokensResult struct {
	AccessToken  string `json:"accessToken"`
	RefreshToken string `json:"refreshToken"`
}

func (s *AuthService) generateTokens(userID int) (*GenerateTokensResult, error) {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"exp":     &jwt.NumericDate{Time: time.Now().Add(24 * 30 * time.Hour)},
		"user_id": userID,
	})

	accessToken, err := token.SignedString([]byte(s.config.JwtAccessSecret))
	if err != nil {
		return nil, err
	}

	token = jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"exp":     &jwt.NumericDate{Time: time.Now().Add(24 * 30 * time.Hour)},
		"user_id": userID,
	})

	refreshToken, err := token.SignedString([]byte(s.config.JwtRefreshSecret))
	if err != nil {
		return nil, err
	}

	return &GenerateTokensResult{
		AccessToken:  accessToken,
		RefreshToken: refreshToken,
	}, nil
}

func (s *AuthService) ChangePassword(
	ctx context.Context,
	user *domain.User,
	dto *domain.ChangePasswordDto,
) (*GenerateTokensResult, error) {
	err := dto.Validate()
	if err != nil {
		return nil, err
	}

	if err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(dto.OldPassword)); err != nil {
		return nil, err
	}

	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(dto.NewPassword), 14)
	if err != nil {
		return nil, err
	}

	updatedUser, err := s.repositories.UserRepository.ChangePassword(ctx, user.ID, string(hashedPassword))
	if err != nil {
		return nil, err
	}

	return s.generateTokens(updatedUser.ID)
}
