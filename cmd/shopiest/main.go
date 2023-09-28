package main

import (
	"context"
	"fmt"
	"github.com/LorezV/shopiest.git/internal/config"
	"github.com/LorezV/shopiest.git/internal/repositories"
	"github.com/LorezV/shopiest.git/internal/repositories/postgres"
	"github.com/LorezV/shopiest.git/internal/services"
	"github.com/LorezV/shopiest.git/internal/transport/grpctransport"
	"github.com/LorezV/shopiest.git/internal/transport/httptransport"
	"github.com/joho/godotenv"
	"log"
	"net"
	"os"
	"os/signal"
	"syscall"
	"time"
)

func init() {
	if err := godotenv.Load(); err != nil {
		log.Println("No .env file found")
	}
}

func main() {
	cfg := config.NewApplicationConfig()

	pg := postgres.NewPostgres(cfg)
	if err := pg.DialConnection(); err != nil {
		log.Fatal(err)
	}

	if err := pg.RunMigrations(context.Background()); err != nil {
		log.Fatal(err)
	}

	rManager := repositories.NewManager(
		postgres.NewUserRepository(pg),
		postgres.NewProductRepository(pg),
	)

	sManager := services.NewManager(
		services.NewAuthService(rManager, cfg),
		services.NewUserService(rManager),
		services.NewProductService(rManager),
	)

	httpServer := httptransport.NewHttpServer(cfg, sManager)

	grpcServer := grpctransport.NewGRPCServer(cfg, sManager)

	stopped := make(chan struct{})
	go func() {
		sigint := make(chan os.Signal, 1)
		signal.Notify(sigint, os.Interrupt, syscall.SIGINT, syscall.SIGTERM)

		<-sigint

		ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
		defer cancel()

		if err := httpServer.Shutdown(ctx); err != nil {
			log.Fatal(err)
		}

		close(stopped)
	}()

	go func() {
		log.Printf("Starting HTTP server on %s", httpServer.Addr)

		if err := httpServer.ListenAndServe(); err != nil {
			log.Fatal(err)
		}
	}()

	go func() {
		addr := fmt.Sprintf("%s:%s", cfg.Host, cfg.GrpcPort)

		log.Printf("Starting GRPC server on %s", addr)

		listen, err := net.Listen("tcp", addr)
		if err != nil {
			log.Fatal(err)
		}

		if err := grpcServer.Serve(listen); err != nil {
			log.Fatal(err)
		}
	}()

	<-stopped
}
