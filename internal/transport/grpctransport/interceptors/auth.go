package interceptors

import (
	"context"
	"github.com/LorezV/shopiest.git/internal/config"
	"github.com/LorezV/shopiest.git/internal/domain"
	"github.com/LorezV/shopiest.git/internal/services"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
	"strings"
)

type AuthInterceptor struct {
	config   *config.Config
	services *services.Manager
}

func NewAuthInterceptor(cfg *config.Config, services *services.Manager) *AuthInterceptor {
	return &AuthInterceptor{
		cfg,
		services,
	}
}

func (i *AuthInterceptor) AuthorizationUnary(ctx context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (interface{}, error) {
	newCtx := ctx

	user, err := i.authorize(ctx)
	if err == nil {
		newCtx = context.WithValue(ctx, "user", user)
	}

	return handler(newCtx, req)
}

func (i *AuthInterceptor) AuthorizationStream(srv interface{}, stream grpc.ServerStream, info *grpc.StreamServerInfo, handler grpc.StreamHandler) error {
	newStream := stream

	user, err := i.authorize(stream.Context())
	if err == nil {
		newStream = ServerStream{
			ServerStream: stream,
			ctx:          context.WithValue(stream.Context(), "user", user),
		}
	}

	return handler(srv, newStream)
}

func (i *AuthInterceptor) authorize(ctx context.Context) (*domain.User, error) {
	md, ok := metadata.FromIncomingContext(ctx)
	if !ok {
		return nil, status.Errorf(codes.Unauthenticated, "metadata is not provided")
	}

	values := md["authorization"]
	if len(values) == 0 {
		return nil, status.Errorf(codes.Unauthenticated, "authorization token is not provided")
	}

	token := values[0]
	if strings.Contains(token, "Bearer ") {
		token = strings.ReplaceAll(token, "Bearer ", "")
	}

	user, err := i.services.AuthService.Authorize(ctx, token)
	if err != nil {
		return nil, status.Errorf(codes.Unauthenticated, err.Error())
	}

	return user, nil
}
