from datetime import date
from pydantic import BaseModel


class GetListRoomsSchema(BaseModel):
    limit: int | None = None
    offset: int | None = None
    start_date: date | None = None
    end_date: date | None = None
    count_of_people: int | None = None
    price_from: float | None = None
    price_to: float | None = None
    rating: int | None = None
    is_pc: bool | None = None
    is_noisecancelling: bool | None = None
    is_wifi: bool | None = None
    is_breakfast: bool | None = None
    is_biometry_key: bool | None = None
    is_tv: bool | None = None


class GetListAllRoomsSchema(BaseModel):
    limit: int | None = None
    offset: int | None = None
    price_from: float | None = None
    price_to: float | None = None
    rating: int | None = None
    is_pc: bool | None = None
    is_noisecancelling: bool | None = None
    is_wifi: bool | None = None
    is_breakfast: bool | None = None
    is_biometry_key: bool | None = None
    is_tv: bool | None = None


class ReservationRoomSchema(BaseModel):
    reservation_id: int
    count_of_people: int
    start_date: date
    end_date: date


class GetReservationsHistorySchema(BaseModel):
    limit: int | None = None
    offset: int | None = None
