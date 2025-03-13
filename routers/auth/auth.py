from zoneinfo import ZoneInfo
from database.models import Users
from database.services.dao import UserDAO
from fastapi import APIRouter, Depends, Query, Request
from fastapi.responses import JSONResponse
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer
from routers.auth.schemas import LoginSchema, RecoveryPasswordSchema, RegisterUserSchema
from routers.auth.utils import (
    check_password,
    create_access_token,
    create_refresh_token,
    decode_token,
    get_timezone_by_ip,
    hash_password,
    send_message_to_email,
)


router = APIRouter(prefix="/auth", tags=["Auth"])

security = HTTPBearer()


@router.post("/register", summary="Регистрация пользователя")
async def register_user(data: RegisterUserSchema, request: Request):
    user = await UserDAO.find_one_by_filters(email=data.email)

    if user:
        return JSONResponse({"message": "User already exists"}, 401)

    # client_ip = request.client.host  Если не на локальном сервере

    client_ip = "101.0.22.0"  # На локальном сервере

    timezone = get_timezone_by_ip(client_ip)

    if not timezone:
        return JSONResponse({"message": "Timezone not found"}, 401)

    user = Users(
        name=data.name,
        surname=data.surname,
        birth_date=data.birth_date,
        email=data.email,
        password_hash=hash_password(data.password),
        time_zone=timezone,
    )

    await UserDAO.add_one(user)

    return JSONResponse({"message": "User created"}, 201)


@router.post("/login", summary="Вход пользователя")
async def login_user(data: LoginSchema):
    user = await UserDAO.find_one_by_filters(email=data.email)

    if not user:
        return JSONResponse({"message": "User not found"}, 401)

    if not check_password(data.password, user.password_hash):
        return JSONResponse({"message": "Wrong password"}, 401)

    token = create_access_token(
        data={"sub": "hotel", "user_id": user.id, "email": user.email}
    )

    refresh_token = create_refresh_token(
        data={"sub": "hotel", "user_id": user.id, "email": user.email}
    )

    return {
        "access_token": token,
        "refresh_token": refresh_token,
        "token_type": "Bearer",
    }


@router.post("/refresh", summary="Обновление токена")
async def refresh_token(credentials: HTTPAuthorizationCredentials = Depends(security)):
    token = credentials.credentials

    try:
        payload = decode_token(token)
        user_id = payload["user_id"]
        email = payload["email"]
        type = payload["type"]
    except Exception as e:
        print(e)
        return JSONResponse({"status": "Invalid token"}, 401)

    user = await UserDAO.find_one_by_filters(id=user_id, email=email)

    if type != "refresh":
        return JSONResponse({"status": "You token is not refresh"}, 401)

    if not user:
        return JSONResponse({"status": "User not authorized"}, 404)

    token = create_access_token(
        data={"sub": "hotel", "user_id": user.id, "email": user.email}
    )

    refresh_token = create_refresh_token(
        data={"sub": "hotel", "user_id": user.id, "number": user.email}
    )

    return {
        "access_token": token,
        "refresh_token": refresh_token,
        "token_type": "Bearer",
    }
