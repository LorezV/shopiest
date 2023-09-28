package controller

import (
	"encoding/json"
	"github.com/LorezV/shopiest.git/internal/domain"
	"github.com/LorezV/shopiest.git/internal/services"
	"net/http"
)

type UserController struct {
	services *services.Manager
}

func NewUserController(services *services.Manager) *UserController {
	return &UserController{
		services,
	}
}

func (c *UserController) Profile(w http.ResponseWriter, r *http.Request) {
	user := r.Context().Value("user").(*domain.User)

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	if err := json.NewEncoder(w).Encode(user); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}
