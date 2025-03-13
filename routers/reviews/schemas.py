from pydantic import BaseModel


class CreateReviewSchema(BaseModel):
    room_id: int
    text: str
    rating: int
