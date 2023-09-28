package servers

import (
	"context"
	"errors"
	"github.com/LorezV/shopiest.git/internal/domain"
	"github.com/LorezV/shopiest.git/internal/services"
	"github.com/LorezV/shopiest.git/proto"
)

type AuthServer struct {
	proto.UnsafeAuthServer
	services *services.Manager
}

func NewAuthServer(services *services.Manager) *AuthServer {
	return &AuthServer{
		services: services,
	}
}

func (s *AuthServer) Login(ctx context.Context, data *proto.LoginRequest) (*proto.TokenResponse, error) {
	contextUser := ctx.Value("user")

	if contextUser != nil {
		return nil, errors.New("you are already logged in")
	}

	tokens, err := s.services.AuthService.Login(ctx,
		&domain.LoginDto{
			Email:    data.Email,
			Password: data.Password,
		},
	)

	if err != nil {
		return nil, err
	}

	return &proto.TokenResponse{
		AccessToken:  tokens.AccessToken,
		RefreshToken: tokens.RefreshToken,
	}, nil
}

func (s *AuthServer) Registration(ctx context.Context, data *proto.RegistrationRequest) (*proto.TokenResponse, error) {
	contextUser := ctx.Value("user")

	if contextUser != nil {
		return nil, errors.New("you are already logged in")
	}

	tokens, err := s.services.AuthService.Register(ctx,
		&domain.RegistrationDto{
			Email:          data.Email,
			Password:       data.Password,
			PasswordRepeat: data.PasswordRepeat,
			Eula:           data.Eula,
		},
	)

	if err != nil {
		return nil, err
	}

	return &proto.TokenResponse{
		AccessToken:  tokens.AccessToken,
		RefreshToken: tokens.RefreshToken,
	}, nil
}

func (s *AuthServer) Refresh(ctx context.Context, data *proto.RefreshRequest) (*proto.TokenResponse, error) {
	contextUser := ctx.Value("user")

	if contextUser != nil {
		return nil, errors.New("you are already logged in")
	}

	tokens, err := s.services.AuthService.Refresh(ctx, data.RefreshToken)

	if err != nil {
		return nil, err
	}

	return &proto.TokenResponse{
		AccessToken:  tokens.AccessToken,
		RefreshToken: tokens.RefreshToken,
	}, nil
}

func (s *AuthServer) ChangePassword(ctx context.Context, data *proto.ChangePasswordRequest) (*proto.TokenResponse, error) {
	user := ctx.Value("user").(*domain.User)

	tokens, err := s.services.AuthService.ChangePassword(
		ctx,
		user,
		&domain.ChangePasswordDto{
			OldPassword:       data.OldPassword,
			NewPassword:       data.NewPassword,
			NewPasswordRepeat: data.NewPasswordRepeat,
		},
	)

	if err != nil {
		return nil, err
	}

	return &proto.TokenResponse{
		AccessToken:  tokens.AccessToken,
		RefreshToken: tokens.RefreshToken,
	}, nil
}
