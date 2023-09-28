package services

type Manager struct {
	AuthService    *AuthService
	UserService    *UserService
	ProductService *ProductService
}

func NewManager(
	auth *AuthService,
	user *UserService,
	product *ProductService,
) *Manager {
	return &Manager{
		auth,
		user,
		product,
	}
}
