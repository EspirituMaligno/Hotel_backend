from fastapi import APIRouter, UploadFile, File, Depends
import os
import uuid
from typing import List

from routers.files.dto import MessageResponseDTO

router = APIRouter(prefix="/files", tags=["files"])

ALLOWED_IMAGE_EXTENSIONS = {".jpg", ".jpeg", ".png", ".gif", ".webp"}


@router.post(
    "/upload", summary="Загрузка изображения", response_model=MessageResponseDTO
)
async def upload_image(file: UploadFile = File(...)):
    if not file.content_type.startswith("image/"):
        return MessageResponseDTO(
            message="Файл должен быть изображением", status_code=400
        )

    file_extension = os.path.splitext(file.filename)[1].lower()
    if file_extension not in ALLOWED_IMAGE_EXTENSIONS:
        return MessageResponseDTO(
            message=f"Недопустимое расширение файла. Допустимые расширения: {', '.join(ALLOWED_IMAGE_EXTENSIONS)}",
            status_code=400,
        )

    os.makedirs("static/images", exist_ok=True)

    file_name = f"{uuid.uuid4()}{file_extension}"
    file_path = f"static/images/{file_name}"

    with open(file_path, "wb") as buffer:
        content = await file.read()
        buffer.write(content)

    return MessageResponseDTO(
        message="Изображение успешно загружено",
        status_code=200,
        data={"url": f"http://localhost:5000/static/images/{file_name}"},
    )
