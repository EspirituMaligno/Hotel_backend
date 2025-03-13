from sqlalchemy.ext.asyncio import AsyncSession, create_async_engine, async_sessionmaker
from sqlalchemy.exc import SQLAlchemyError
import asyncio

from config import POSTGRES_URL

# from database.models import Base

engine = create_async_engine(POSTGRES_URL, pool_size=100, max_overflow=0)

async_session = async_sessionmaker(engine, expire_on_commit=False)
