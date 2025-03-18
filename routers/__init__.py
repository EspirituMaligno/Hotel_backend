from fastapi import APIRouter
from routers.auth.auth import router as auth_router
from routers.user.user import router as user_router
from routers.rooms.rooms import router as rooms_router
from routers.reviews.reviews import router as reviews_router

main_router = APIRouter()


main_router.include_router(auth_router)
main_router.include_router(user_router)
main_router.include_router(rooms_router)
main_router.include_router(reviews_router)

__all__ = ["main_router"]
