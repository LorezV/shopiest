package interceptors

import (
	"context"
	"google.golang.org/grpc"
)

type ServerStream struct {
	grpc.ServerStream
	ctx context.Context
}
