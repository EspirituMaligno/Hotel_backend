from database.models import Reservation, Users
from database.services.dao import ReservationDAO, RoomDAO, UserDAO
from fastapi import APIRouter, Depends, Query
from fastapi.responses import JSONResponse
from routers.dependencies import get_current_user
from routers.rooms.schemas import (
    GetListRoomsSchema,
    GetReservationsHistorySchema,
    ReservationRoomSchema,
)

router = APIRouter(prefix="/rooms", tags=["Rooms"])


@router.get("/list", summary="Получить список номеров с паггинацией и фильтрами")
async def get_list_rooms(
    data: GetListRoomsSchema = Query(...), user: Users = Depends(get_current_user)
):
    return await RoomDAO.find_available_rooms(
        start_date=data.start_date,
        end_date=data.end_date,
        limit=data.limit,
        offset=data.offset,
        price_from=data.price_from,
        price_to=data.price_to,
        rating=data.rating,
        room_count=data.room_count,
        is_conditioning=data.is_conditioning,
    )


@router.get("/one", summary="Получить один номер по room_id")
async def get_one_room(
    room_id: int = Query(...), user: Users = Depends(get_current_user)
):
    return await RoomDAO.find_one_by_filters(id=room_id)


@router.post("/", summary="Забронировать номер")
async def book_room(
    data: ReservationRoomSchema, user: Users = Depends(get_current_user)
):
    room = await RoomDAO.find_one_by_filters(id=data.room_id)

    if not room:
        return JSONResponse(status_code=404, content={"message": "Room not found"})

    difference_date = data.end_date - data.start_date
    count_nights = difference_date.days - 1
    price = room.price * count_nights

    new_book = Reservation(
        room_id=data.room_id,
        user_id=user.id,
        start_date=data.start_date,
        end_date=data.end_date,
        count_nights=count_nights,
        price=price,
    )

    await RoomDAO.add_one(new_book)

    return JSONResponse(status_code=201, content={"message": "Room was reserved"})


@router.get("/reservations", summary="История бронирований")
async def get_reservations(
    data: GetReservationsHistorySchema = Query(...),
    user: Users = Depends(get_current_user),
):
    reservations = await ReservationDAO.find_all(
        limit=data.limit, offset=data.offset, user_id=user.id
    )

    res = []

    for r in reservations:
        room = await RoomDAO.find_one_by_filters(id=r.room_id)

        res.append(
            {
                "id": r.id,
                "user_id": r.user_id,
                "room": {
                    "id": room.id,
                    "preview": room.preview,
                    "price": room.price,
                    "room_count": room.room_count,
                    "description": room.description,
                    "is_conditioning": room.is_conditioning,
                    "rating": room.rating,
                },
                "start_date": r.start_date,
                "end_date": r.end_date,
                "count_nights": r.count_nights,
                "price": r.price,
            }
        )

    return res


@router.delete(
    "/", summary="Удалить бронирование(Со стороны пользователя, отмена брони)"
)
async def cancel_reservation(
    reservation_id: int = Query(...), user: Users = Depends(get_current_user)
):
    try:
        await ReservationDAO.delete_one(id=reservation_id)
        return JSONResponse({"status": "Reservation was deleted"})
    except:
        return JSONResponse(
            status_code=404, content={"message": "Reservation not found"}
        )
