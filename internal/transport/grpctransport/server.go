package grpctransport

import (
	"github.com/LorezV/shopiest.git/internal/config"
	"github.com/LorezV/shopiest.git/internal/services"
	"github.com/LorezV/shopiest.git/internal/transport/grpctransport/interceptors"
	"github.com/LorezV/shopiest.git/internal/transport/grpctransport/servers"
	"github.com/LorezV/shopiest.git/proto"
	"google.golang.org/grpc"
)

func NewGRPCServer(cfg *config.Config, services *services.Manager) *grpc.Server {
	authInterceptor := interceptors.NewAuthInterceptor(cfg, services)

	authServer := servers.NewAuthServer(services)

	s := grpc.NewServer(
		grpc.UnaryInterceptor(authInterceptor.AuthorizationUnary),
		grpc.StreamInterceptor(authInterceptor.AuthorizationStream),
	)

	proto.RegisterAuthServer(s, authServer)

	return s
}
