from datetime import date
import re
from pydantic import BaseModel, EmailStr, Field, validator


class RegisterUserSchema(BaseModel):
    name: str = Field(..., min_length=2, max_length=20, description="Имя пользователя")
    surname: str = Field(
        ..., min_length=3, max_length=30, description="Фамилия пользователя"
    )
    birth_date: date = Field(
        ..., description="Дата рождения пользователя в формате YYYY-MM-DD"
    )
    email: EmailStr
    password: str = Field(
        ...,
        min_length=8,
        max_length=70,
        description="Пароль юзера, от 8 до 70 символов",
    )

    @validator("password")
    def validate_password(cls, v):
        if not re.search(r"[a-z]", v):
            raise ValueError("Пароль должен содержать хотя бы одну строчную букву")

        if not re.search(r"[0-9]", v):
            raise ValueError("Пароль должен содержать хотя бы одну цифру")

        return v

    @validator("birth_date")
    def validate_birth_date(cls, v):
        today = date.today()
        age = today.year - v.year - ((today.month, today.day) < (v.month, v.day))

        if age < 18:
            raise ValueError("Пользователь должен быть старше 18 лет")

        return v


class LoginSchema(BaseModel):
    email: EmailStr
    password: str

    @validator("password")
    def validate_password(cls, v):
        if not re.search(r"[a-z]", v):
            raise ValueError("Пароль должен содержать хотя бы одну строчную букву")

        if not re.search(r"[0-9]", v):
            raise ValueError("Пароль должен содержать хотя бы одну цифру")

        return v


class RecoveryPasswordSchema(BaseModel):
    email: EmailStr
