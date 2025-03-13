from zoneinfo import ZoneInfo

from pytz import timezone
from database.models import Users
from database.services.dao import UserDAO
from fastapi import APIRouter, Depends, Query
from fastapi.responses import JSONResponse
from routers.dependencies import get_current_user
from routers.user.schemas import GetAllUsersSchema

router = APIRouter(prefix="/user", tags=["User"])


@router.get("/", summary="Получить юзера")
async def get_all_users(user: Users = Depends(get_current_user)):
    # user = await UserDAO.find_one_by_filters(id=user.id)

    zone_info = timezone(user.time_zone)

    created_at = user.created_at.astimezone(zone_info)

    res = {
        "id": user.id,
        "name": user.name,
        "surname": user.surname,
        "birth_date": user.birth_date,
        "email": user.email,
        "created_at": created_at,
    }

    return res
