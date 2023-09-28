package postgres

import (
	"context"
	"fmt"
	"github.com/LorezV/shopiest.git/internal/config"
	"github.com/jackc/pgx/v5"
	"log"
	"os"
	"path"
	"time"
)

type Postgres struct {
	conn   *pgx.Conn
	config *config.Config
}

func NewPostgres(cfg *config.Config) *Postgres {
	return &Postgres{
		config: cfg,
	}
}

func (p *Postgres) DialConnection() error {
	conn, err := pgx.Connect(context.Background(), p.config.PostgresDsn)
	if err != nil {
		return err
	}

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	if err := conn.Ping(ctx); err != nil {
		return err
	}

	p.conn = conn

	return nil
}

func (p *Postgres) RunMigrations(ctx context.Context) error {
	files, err := os.ReadDir(p.config.PostgresMigrationsPath)
	if err != nil {
		return err
	}

	for _, file := range files {
		data, err := os.ReadFile(path.Join(p.config.PostgresMigrationsPath, file.Name()))
		if err != nil {
			return err
		}

		if _, err = p.conn.Exec(ctx, string(data)); err != nil {
			log.Println(err.Error())
		}

		log.Println(fmt.Sprintf("Database has successfully migrated by \"%s\"", file.Name()))
	}

	return nil
}
