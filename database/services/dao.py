from datetime import date
from typing import List, Union
from database.services.base import BaseDAO
from sqlalchemy import (
    and_,
    case,
    distinct,
    not_,
    or_,
    select,
    func,
    delete,
    desc,
    update,
)
from sqlalchemy.orm import selectinload, subqueryload

from database.db import async_session


from database.models import Reservation, Reviews, Rooms, Users


class UserDAO(BaseDAO):
    model = Users


class RoomDAO(BaseDAO):
    model = Rooms

    @classmethod
    async def find_available_rooms(
        cls,
        start_date: date | None = None,
        end_date: date | None = None,
        limit: int | None = None,
        offset: int | None = None,
        price_from: float | None = None,
        price_to: float | None = None,
        rating: int | None = None,
        room_count: int | None = None,
        is_conditioning: bool | None = None,
    ):
        # Подзапрос для поиска забронированных номеров
        subquery = (
            select(Reservation.room_id)
            .where(
                and_(
                    Reservation.start_date <= end_date,
                    Reservation.end_date >= start_date,
                )
            )
            .distinct()
        )

        # Основной запрос: исключаем номера, которые есть в подзапросе
        query = select(cls.model).where(not_(cls.model.id.in_(subquery)))

        # Добавляем фильтры
        if price_from is not None and price_to is not None:
            query = query.where(cls.model.price.between(price_from, price_to))
        elif price_from is not None:
            query = query.where(cls.model.price >= price_from)
        elif price_to is not None:
            query = query.where(cls.model.price <= price_to)

        if rating is not None:
            query = query.where(cls.model.rating == rating)

        if room_count is not None:
            query = query.where(cls.model.room_count == room_count)

        if is_conditioning is not None:
            query = query.where(cls.model.is_conditioning == is_conditioning)

        # Применяем пагинацию
        if limit:
            query = query.limit(limit)
        if offset:
            query = query.offset(offset)

        async with async_session() as session:
            result = await session.execute(query)

        return result.scalars().all()


class ReservationDAO(BaseDAO):
    model = Reservation


class ReviewDAO(BaseDAO):
    model = Reviews
