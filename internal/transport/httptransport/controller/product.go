package controller

import (
	"encoding/json"
	"github.com/LorezV/shopiest.git/internal/services"
	"net/http"
)

type ProductController struct {
	services *services.Manager
}

func NewProductController(services *services.Manager) *ProductController {
	return &ProductController{
		services,
	}
}

func (c *ProductController) FindAll(w http.ResponseWriter, r *http.Request) {
	products, err := c.services.ProductService.FindAll(r.Context())

	if err != nil {
		http.Error(w, "", http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	if err := json.NewEncoder(w).Encode(products); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}
