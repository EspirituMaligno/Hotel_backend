from sqlalchemy import delete, update
from sqlalchemy.future import select

from database.db import async_session


class BaseDAO:
    model = None

    @classmethod
    async def find_all(cls, limit: int = None, offset: int = None, **filter_by):
        query = select(cls.model).filter_by(**filter_by)

        if limit:
            query = query.limit(limit)

        if offset:
            query = query.offset(offset)

        async with async_session() as session:
            result = await session.execute(query)

        return result.scalars().all()

    @classmethod
    async def find_one_by_filters(cls, **filter_by):
        query = select(cls.model).filter_by(**filter_by)

        async with async_session() as session:
            result = await session.execute(query)

        return result.scalar_one_or_none()

    @classmethod
    async def add_one(cls, entity):
        async with async_session() as session:
            session.add(entity)
            await session.commit()

    @classmethod
    async def delete_one(cls, **filter_by):
        query = delete(cls.model).filter_by(**filter_by)
        async with async_session() as session:
            await session.execute(query)
            await session.commit()

    @classmethod
    async def update_one(cls, **kwargs):
        filter_by = {k: v for k, v in kwargs.items() if k == "id"}
        values = {k: v for k, v in kwargs.items() if k != "id"}

        query = update(cls.model).filter_by(**filter_by).values(**values)
        async with async_session() as session:
            await session.execute(query)
            await session.commit()
