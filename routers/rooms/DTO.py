from datetime import date
from typing import List, Optional
from pydantic import BaseModel


class RoomResponseDTO(BaseModel):
    id: int
    preview: Optional[str]
    name: Optional[str]
    description: Optional[str]
    room_count: int
    count_of_people: Optional[int]
    price: float
    rating: Optional[int]
    is_noisecancelling: Optional[bool]
    is_wifi: Optional[bool]
    is_pc: Optional[bool]
    is_breakfast: Optional[bool]
    is_biometry_key: Optional[bool]
    is_tv: Optional[bool]


class BusyDatesResponseDTO(BaseModel):
    start_date: date
    end_date: date


class RoomInfoResponseDTO(BaseModel):
    id: int
    preview: Optional[str]
    name: Optional[str]
    description: Optional[str]
    room_count: int
    count_of_people: Optional[int]
    price: float
    rating: Optional[int]


class ReservationResponseDTO(BaseModel):
    id: int
    user_id: int
    room: RoomInfoResponseDTO
    start_date: date
    end_date: date
    count_nights: int
    price: float


class ReservationStatusResponseDTO(BaseModel):
    status: str
    message: str
