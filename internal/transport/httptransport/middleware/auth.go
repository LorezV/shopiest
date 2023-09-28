package middleware

import (
	"context"
	"github.com/LorezV/shopiest.git/internal/config"
	"github.com/LorezV/shopiest.git/internal/services"
	"net/http"
	"strings"
)

type AuthMiddleware struct {
	config   *config.Config
	services *services.Manager
}

func NewAuthMiddleware(config *config.Config, services *services.Manager) *AuthMiddleware {
	return &AuthMiddleware{
		config,
		services,
	}
}

func (m *AuthMiddleware) Authorization(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		token := r.Header.Get("Authorization")
		if strings.Contains(token, "Bearer ") {
			token = strings.ReplaceAll(token, "Bearer ", "")
		}

		user, err := m.services.AuthService.Authorize(r.Context(), token)
		if err == nil {
			r = r.WithContext(context.WithValue(r.Context(), "user", user))
		}

		next.ServeHTTP(w, r)
	})
}

func (m *AuthMiddleware) AuthorizationGuard(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		user := r.Context().Value("user")

		if user == nil {
			http.Error(w, "you are not authorized", http.StatusUnauthorized)
			return
		}

		next.ServeHTTP(w, r)
	})
}
