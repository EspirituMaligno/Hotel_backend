from pydantic import BaseModel


class GetAllUsersSchema(BaseModel):
    limit: int | None = None
    offset: int | None = None
