from zoneinfo import ZoneInfo
from database.models import Users
from database.services.dao import UserDAO
from fastapi import APIRouter, Depends, Query, Request, status
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
from routers.auth.DTO import AuthResponseDTO, MessageResponseDTO


router = APIRouter(prefix="/auth", tags=["Auth"])

security = HTTPBearer()


@router.post(
    "/register",
    summary="Регистрация пользователя",
    response_model=MessageResponseDTO,
    status_code=status.HTTP_201_CREATED,
)
async def register_user(data: RegisterUserSchema, request: Request):
    user = await UserDAO.find_one_by_filters(email=data.email)

    if user:
        return MessageResponseDTO(
            message="User already exists", status_code=status.HTTP_401_UNAUTHORIZED
        )

    # client_ip = request.client.host  Если не на локальном сервере

    client_ip = "101.0.22.0"  # На локальном сервере

    timezone = get_timezone_by_ip(client_ip)

    if not timezone:
        return MessageResponseDTO(
            message="Timezone not found", status_code=status.HTTP_401_UNAUTHORIZED
        )

    user = Users(
        name=data.name,
        surname=data.surname,
        birth_date=data.birth_date,
        email=data.email,
        password_hash=hash_password(data.password),
        time_zone=timezone,
    )

    await UserDAO.add_one(user)

    return MessageResponseDTO(
        message="User created", status_code=status.HTTP_201_CREATED
    )


@router.post("/login", summary="Вход пользователя", response_model=AuthResponseDTO)
async def login_user(data: LoginSchema):
    user = await UserDAO.find_one_by_filters(email=data.email)

    if not user:
        return MessageResponseDTO(
            message="User not found", status_code=status.HTTP_401_UNAUTHORIZED
        )

    if not check_password(data.password, user.password_hash):
        return MessageResponseDTO(
            message="Wrong password", status_code=status.HTTP_401_UNAUTHORIZED
        )

    token = create_access_token(data={"sub": "hotel", "user_id": user.id})

    refresh_token = create_refresh_token(data={"sub": "hotel", "user_id": user.id})

    return AuthResponseDTO(
        access_token=token, refresh_token=refresh_token, token_type="Bearer"
    )


@router.post("/refresh", summary="Обновление токена", response_model=AuthResponseDTO)
async def refresh_token(credentials: HTTPAuthorizationCredentials = Depends(security)):
    token = credentials.credentials

    try:
        payload = decode_token(token)
        user_id = payload["user_id"]
        type = payload["type"]
    except Exception as e:
        print(e)
        return MessageResponseDTO(
            message="Invalid token", status_code=status.HTTP_401_UNAUTHORIZED
        )

    user = await UserDAO.find_one_by_filters(id=user_id)

    if type != "refresh":
        return MessageResponseDTO(
            message="You token is not refresh", status_code=status.HTTP_401_UNAUTHORIZED
        )

    if not user:
        return MessageResponseDTO(
            message="User not authorized", status_code=status.HTTP_404_NOT_FOUND
        )

    token = create_access_token(data={"sub": "hotel", "user_id": user.id})

    refresh_token = create_refresh_token(data={"sub": "hotel", "user_id": user.id})

    return AuthResponseDTO(
        access_token=token, refresh_token=refresh_token, token_type="Bearer"
    )
