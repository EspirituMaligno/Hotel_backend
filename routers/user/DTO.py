from datetime import date, datetime
from pydantic import BaseModel


class UserResponseDTO(BaseModel):
    id: int
    name: str
    surname: str
    birth_date: date
    email: str
    created_at: datetime
