from fastapi import APIRouter, Depends, Query
from fastapi.responses import JSONResponse
from pytz import timezone

from database.models import Reviews, Users
from database.services.dao import ReviewDAO, RoomDAO, UserDAO
from routers.dependencies import get_current_user
from routers.reviews.schemas import CreateReviewSchema


router = APIRouter(prefix="/reviews", tags=["Reviews"])


@router.post("/", summary="Создать отзыв")
async def create_review(
    data: CreateReviewSchema, user: Users = Depends(get_current_user)
):
    review = Reviews(
        user_id=user.id, room_id=data.room_id, text=data.text, rating=data.rating
    )
    room = await RoomDAO.find_one_by_filters(id=data.room_id)
    reviews = await ReviewDAO.find_all(room_id=data.room_id)

    if not reviews:
        reviews_count = 1
    else:
        reviews_count = len(reviews) + 1

    room.rating = (review.rating + room.rating) / reviews_count

    await RoomDAO.add_one(room)

    await ReviewDAO.add_one(review)

    return JSONResponse({"status": "Review was created"})


@router.get("/list", summary="Получить отзывы по room_id")
async def get_list_reviews(
    room_id: int = Query(...), user: Users = Depends(get_current_user)
):
    reviews = await ReviewDAO.find_all(room_id=room_id)

    if not reviews:
        return []

    res = []

    for review in reviews:
        us = await UserDAO.find_one_by_filters(id=review.user_id)
        room = await RoomDAO.find_one_by_filters(id=review.room_id)

        zone_info = timezone(user.time_zone)

        created_at = review.created_at.astimezone(zone_info)

        res.append(
            {
                "review_id": review.id,
                "user": {
                    "user_id": us.id,
                    "name": us.name,
                },
                "room": {"room_id": room.id},
                "text": review.text,
                "rating": review.rating,
                "created_at": created_at,
            }
        )

    return res


@router.get("/one", summary="Получить один отзыв по review_id")
async def get_one_review(
    review_id: int = Query(...), user: Users = Depends(get_current_user)
):
    review = await ReviewDAO.find_one_by_filters(review_id=review_id)

    return review if review else []
