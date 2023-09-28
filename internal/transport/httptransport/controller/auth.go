package controller

import (
	"encoding/json"
	"github.com/LorezV/shopiest.git/internal/domain"
	"github.com/LorezV/shopiest.git/internal/services"
	"net/http"
)

type AuthController struct {
	services *services.Manager
}

func NewAuthController(services *services.Manager) *AuthController {
	return &AuthController{
		services,
	}
}

func (c *AuthController) Login(w http.ResponseWriter, r *http.Request) {
	data := &domain.LoginDto{}

	if err := json.NewDecoder(r.Body).Decode(data); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	tokens, err := c.services.AuthService.Login(r.Context(), data)
	if err != nil {
		http.Error(w, err.Error(), http.StatusUnauthorized)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	if err = json.NewEncoder(w).Encode(tokens); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}

func (c *AuthController) Registration(w http.ResponseWriter, r *http.Request) {
	data := &domain.RegistrationDto{}

	if err := json.NewDecoder(r.Body).Decode(data); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	tokens, err := c.services.AuthService.Register(r.Context(), data)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	if err = json.NewEncoder(w).Encode(tokens); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}

func (c *AuthController) Refresh(w http.ResponseWriter, r *http.Request) {
	data := &struct {
		RefreshToken string `json:"refreshToken"`
	}{}

	if err := json.NewDecoder(r.Body).Decode(data); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	tokens, err := c.services.AuthService.Refresh(r.Context(), data.RefreshToken)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	if err = json.NewEncoder(w).Encode(tokens); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}

func (c *AuthController) ChangePassword(w http.ResponseWriter, r *http.Request) {
	user := r.Context().Value("user").(*domain.User)

	data := &domain.ChangePasswordDto{}

	if err := json.NewDecoder(r.Body).Decode(data); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	tokens, err := c.services.AuthService.ChangePassword(r.Context(), user, data)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	if err = json.NewEncoder(w).Encode(tokens); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}
