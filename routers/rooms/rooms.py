from database.models import Reservation, Users
from database.services.dao import ReservationDAO, RoomDAO, UserDAO
from fastapi import APIRouter, Depends, Query, HTTPException, status
from fastapi.responses import JSONResponse
from routers.dependencies import get_current_user
from routers.rooms.schemas import (
    EditReservationSchema,
    GetListAllRoomsSchema,
    GetListRoomsSchema,
    GetReservationsHistorySchema,
    ReservationRoomSchema,
)
from typing import List
from routers.rooms.DTO import (
    RoomInfoResponseDTO,
    RoomResponseDTO,
    BusyDatesResponseDTO,
    ReservationResponseDTO,
    ReservationStatusResponseDTO,
)

router = APIRouter(prefix="/rooms", tags=["Rooms"])


@router.get(
    "/list",
    summary="Получить список свободных номеров с паггинацией и фильтрами",
    response_model=List[RoomResponseDTO],
)
async def get_list_rooms(
    data: GetListRoomsSchema = Query(...), user: Users = Depends(get_current_user)
):
    return await RoomDAO.find_available_rooms(
        start_date=data.start_date,
        end_date=data.end_date,
        count_of_people=data.count_of_people,
        limit=data.limit,
        offset=data.offset,
        price_from=data.price_from,
        price_to=data.price_to,
        rating=data.rating,
        is_pc=data.is_pc,
        is_wifi=data.is_wifi,
        is_breakfast=data.is_breakfast,
        is_biometry_key=data.is_biometry_key,
        is_noisecancelling=data.is_noisecancelling,
        is_tv=data.is_tv,
    )


@router.get(
    "/busy/dates",
    summary="Получить список занятых дат по номеру",
    response_model=List[BusyDatesResponseDTO],
)
async def get_busy_dates(
    room_id: int = Query(...), user: Users = Depends(get_current_user)
):
    reservations = await ReservationDAO.find_all(room_id=room_id)
    return [
        BusyDatesResponseDTO(start_date=r.start_date, end_date=r.end_date)
        for r in reservations
    ]


@router.get(
    "/one",
    summary="Получить один номер по room_id",
    response_model=RoomResponseDTO,
)
async def get_one_room(
    room_id: int = Query(...), user: Users = Depends(get_current_user)
):
    return await RoomDAO.find_one_by_filters(id=room_id)


@router.post(
    "/reservations",
    summary="Забронировать номер",
    response_model=ReservationStatusResponseDTO,
)
async def book_room(
    data: ReservationRoomSchema, user: Users = Depends(get_current_user)
):
    room = await RoomDAO.find_one_by_filters(id=data.room_id)

    if not room:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="Номер не найден"
        )

    if room.count_of_people < data.count_of_people:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Количество людей в номере меньше указанного",
        )

    existing_reservations = await ReservationDAO.find_all(room_id=data.room_id)

    for existing_reservation in existing_reservations:
        if (
            data.start_date <= existing_reservation.end_date
            and data.end_date >= existing_reservation.start_date
        ):
            raise HTTPException(
                status_code=status.HTTP_409_CONFLICT,
                detail="Номер уже забронирован на указанные даты",
            )

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

    return ReservationStatusResponseDTO(
        status="success", message="Номер успешно забронирован"
    )


@router.put(
    "/reservations",
    summary="Редактировать бронирование",
    response_model=ReservationStatusResponseDTO,
)
async def update_reservation(
    data: EditReservationSchema,
    user: Users = Depends(get_current_user),
):
    reservation = await ReservationDAO.find_one_by_filters(id=data.reservation_id)

    if not reservation:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Бронирование не найдено",
        )

    if reservation.user_id != user.id:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="У вас нет прав на редактирование этой брони",
        )

    room = await RoomDAO.find_one_by_filters(id=reservation.room_id)
    if not room:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Номер не найден",
        )

    existing_reservations = await ReservationDAO.find_all(room_id=reservation.room_id)

    for existing_reservation in existing_reservations:
        if existing_reservation.id == data.reservation_id:
            continue

        if (
            data.start_date <= existing_reservation.end_date
            and data.end_date >= existing_reservation.start_date
        ):
            raise HTTPException(
                status_code=status.HTTP_409_CONFLICT,
                detail="Номер уже забронирован на указанные даты",
            )

    difference_date = data.end_date - data.start_date
    count_nights = difference_date.days - 1
    price = room.price * count_nights

    await ReservationDAO.update_one(
        id=data.reservation_id,
        start_date=data.start_date,
        end_date=data.end_date,
        count_nights=count_nights,
        price=price,
    )

    return ReservationStatusResponseDTO(
        status="success", message="Бронирование успешно обновлено"
    )


@router.get(
    "/reservations",
    summary="История бронирований",
    response_model=List[ReservationResponseDTO],
)
async def get_reservations(
    data: GetReservationsHistorySchema = Query(...),
    user: Users = Depends(get_current_user),
):
    reservations = await ReservationDAO.find_all(
        limit=data.limit, offset=data.offset, user_id=user.id
    )

    result = []
    for r in reservations:
        room = await RoomDAO.find_one_by_filters(id=r.room_id)
        if room:
            result.append(
                ReservationResponseDTO(
                    id=r.id,
                    user_id=r.user_id,
                    room=RoomInfoResponseDTO(
                        id=room.id,
                        preview=room.preview,
                        name=room.name,
                        description=room.description,
                        room_count=room.room_count,
                        count_of_people=room.count_of_people,
                        price=room.price,
                        rating=room.rating,
                    ),
                    start_date=r.start_date,
                    end_date=r.end_date,
                    count_nights=r.count_nights,
                    price=r.price,
                )
            )

    return result


@router.delete(
    "/reservations",
    summary="Удалить бронирование(Со стороны пользователя, отмена брони)",
    response_model=ReservationStatusResponseDTO,
)
async def cancel_reservation(
    reservation_id: int = Query(...), user: Users = Depends(get_current_user)
):
    try:
        await ReservationDAO.delete_one(id=reservation_id)
        return ReservationStatusResponseDTO(
            status="success", message="Reservation was deleted"
        )
    except:
        return ReservationStatusResponseDTO(
            status="error", message="Reservation not found"
        )
