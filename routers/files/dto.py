from pydantic import BaseModel
from typing import Optional, Dict, Any


class MessageResponseDTO(BaseModel):
    message: str
    status_code: int
    data: Optional[Dict[str, Any]] = None
