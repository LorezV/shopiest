package config

import (
	"github.com/caarlos0/env"
	"log"
)

type Config struct {
	Host                   string `env:"HOST" envDefault:"127.0.0.1"`
	Port                   string `env:"PORT" envDefault:"3000"`
	GrpcPort               string `env:"GRPC_PORT" envDefault:"3001"`
	SecretKey              string `env:"SECRET_KEY" envDefault:"MY_AWESOME_SECRET"`
	JwtAccessSecret        string `env:"JWT_ACCESS_SECRET" envDefault:"MY_AWESOME_SECRET_ACCESS"`
	JwtRefreshSecret       string `env:"JWT_REFRESH_SECRET" envDefault:"MY_AWESOME_SECRET_REFRESH"`
	PostgresDsn            string `env:"POSTGRES_DSN"`
	PostgresMigrationsPath string `env:"POSTGRES_MIGRATIONS_PATH"`
	SmtpHost               string `env:"SMTP_HOST"`
	SmtpPort               string `env:"SMTP_PORT"`
	SmtpLogin              string `env:"SMTP_LOGIN"`
	SmtpPassword           string `env:"SMTP_PASSWORD"`
}

func NewApplicationConfig() *Config {
	cfg := new(Config)

	err := env.Parse(cfg)

	if err != nil {
		log.Fatal(err)
	}

	return cfg
}
