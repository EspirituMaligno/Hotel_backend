import asyncio
from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession
from sqlalchemy.sql import text
import os
from dotenv import load_dotenv

load_dotenv()

# DATABASE
POSTGRES_USER = os.getenv("POSTGRES_USER", "postgres")
POSTGRES_PASSWORD = os.getenv("POSTGRES_PASSWORD", "88355247")
POSTGRES_HOST = os.getenv("POSTGRES_HOST", "db")
POSTGRES_PORT = os.getenv("POSTGRES_PORT", "5432")
POSTGRES_DB = os.getenv("POSTGRES_DB", "hotel_test")

POSTGRES_URL = f"postgresql+asyncpg://{POSTGRES_USER}:{POSTGRES_PASSWORD}@{POSTGRES_HOST}:{POSTGRES_PORT}/{POSTGRES_DB}"

print(
    f"Connecting to database with URL: {POSTGRES_URL}"
)  # Добавляем логирование для отладки


async def init_db():
    engine = create_async_engine(POSTGRES_URL)

    async with engine.begin() as conn:
        result = await conn.execute(
            text("SELECT 1 FROM pg_database WHERE datname=:db_name"),
            {"db_name": POSTGRES_DB},
        )
        if not result.scalar():
            await conn.execute(text(f"CREATE DATABASE {POSTGRES_DB}"))

    db_engine = create_async_engine(POSTGRES_URL)

    async with db_engine.begin() as conn:
        await conn.run_sync(
            lambda sync_conn: alembic.command.upgrade(
                alembic.config.Config("alembic.ini"), "head"
            )
        )

    await engine.dispose()
    await db_engine.dispose()


if __name__ == "__main__":
    import alembic.config
    import alembic.command

    asyncio.run(init_db())
