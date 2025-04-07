from datetime import datetime
from pydantic import BaseModel
from routers.auth.DTO import MessageResponseDTO


class UserInfoDTO(BaseModel):
    user_id: int
    name: str


class RoomInfoDTO(BaseModel):
    room_id: int


class ReviewResponseDTO(BaseModel):
    review_id: int
    user: UserInfoDTO
    room_id: int
    text: str
    rating: int
    created_at: datetime


class ReviewListResponseDTO(BaseModel):
    reviews: list[ReviewResponseDTO] = []
