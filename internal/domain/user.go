package domain

import (
	"errors"
	"github.com/go-ozzo/ozzo-validation"
	"github.com/go-ozzo/ozzo-validation/is"
	"time"
)

type User struct {
	ID        int        `json:"id"`
	Email     string     `json:"email"`
	Password  string     `json:"-"`
	CreatedAt time.Time  `json:"createdAt"`
	UpdatedAt time.Time  `json:"updatedAt"`
	DeletedAt *time.Time `json:"deletedAt"`
}

type LoginDto struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

func (d *LoginDto) Validate() error {
	return validation.ValidateStruct(
		d,
		validation.Field(&d.Email, validation.Required, is.Email),
		validation.Field(&d.Password, validation.Required, validation.Length(6, 36)),
	)
}

type RegistrationDto struct {
	Email          string `json:"email"`
	Password       string `json:"password"`
	PasswordRepeat string `json:"passwordRepeat"`
	Eula           bool   `json:"rules"`
}

func (d *RegistrationDto) Validate() error {
	err := validation.ValidateStruct(
		d,
		validation.Field(&d.Email, validation.Required, is.Email),
		validation.Field(&d.Password, validation.Required, validation.Length(6, 36)),
		validation.Field(&d.Password, validation.Required, validation.Length(6, 36)),
		validation.Field(&d.Eula, validation.Required),
	)

	if err != nil {
		return err
	}

	if d.Password != d.PasswordRepeat {
		return errors.New("passwords must match")
	}

	if d.Eula != true {
		return errors.New("eula must be true")
	}

	return nil
}

type ChangePasswordDto struct {
	OldPassword       string
	NewPassword       string
	NewPasswordRepeat string
}

func (d *ChangePasswordDto) Validate() error {
	err := validation.ValidateStruct(
		d,
		validation.Field(&d.OldPassword, validation.Required, validation.Length(6, 32)),
		validation.Field(&d.NewPassword, validation.Required, validation.Length(6, 32)),
		validation.Field(&d.NewPasswordRepeat, validation.Required, validation.Length(6, 32)),
	)

	if err != nil {
		return err
	}

	if d.NewPassword != d.NewPasswordRepeat {
		return errors.New("passwords must match")
	}

	return nil
}
