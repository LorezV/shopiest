package httptransport

import (
	"encoding/json"
	"fmt"
	"github.com/LorezV/shopiest.git/internal/config"
	"github.com/LorezV/shopiest.git/internal/services"
	"github.com/LorezV/shopiest.git/internal/transport/httptransport/controller"
	"github.com/LorezV/shopiest.git/internal/transport/httptransport/middleware"
	"github.com/gorilla/mux"
	"net/http"
)

func NewHttpServer(cfg *config.Config, services *services.Manager) *http.Server {
	authMiddleware := middleware.NewAuthMiddleware(cfg, services)

	router := mux.NewRouter().PathPrefix("/api").Subrouter()
	router.Use(authMiddleware.Authorization)

	router.HandleFunc("/ping", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(http.StatusOK)
		_ = json.NewEncoder(w).Encode(map[string]bool{
			"pong": true,
		})
	}).Methods("GET")

	authController := controller.NewAuthController(services)
	userController := controller.NewUserController(services)
	productController := controller.NewProductController(services)

	authRouter := router.PathPrefix("/auth").Subrouter()
	authRouter.HandleFunc("/login", authController.Login).Methods("POST")
	authRouter.HandleFunc("/registration", authController.Registration).Methods("POST")
	authRouter.HandleFunc("/refresh", authController.Refresh).Methods("POST")
	authRouter.Handle("/change-password", authMiddleware.AuthorizationGuard(http.HandlerFunc(authController.ChangePassword))).Methods("POST")

	userRouter := router.PathPrefix("/user").Subrouter()
	userRouter.Handle("/me", authMiddleware.AuthorizationGuard(http.HandlerFunc(userController.Profile))).Methods("GET")

	productRouter := router.PathPrefix("/product").Subrouter()
	productRouter.HandleFunc("/catalog", productController.FindAll).Methods("GET")

	return &http.Server{
		Handler: router,
		Addr:    fmt.Sprintf("%s:%s", cfg.Host, cfg.Port),
	}
}
