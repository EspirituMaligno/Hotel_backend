from datetime import date
from pydantic import BaseModel


class GetListRoomsSchema(BaseModel):
    limit: int | None = None
    offset: int | None = None
    start_date: date
    end_date: date
    price_from: float | None = None
    price_to: float | None = None
    rating: int | None = None
    room_count: int | None = None
    is_conditioning: bool | None = None


class ReservationRoomSchema(BaseModel):
    room_id: int
    start_date: date
    end_date: date


class GetReservationsHistorySchema(BaseModel):
    limit: int | None = None
    offset: int | None = None
