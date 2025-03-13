# SQLalchemy PostgreSQL
import os
from dotenv import load_dotenv

load_dotenv()


# DATABASE
POSTGRES_USER = os.getenv("POSTGRES_USER")
POSTGRES_PASSWORD = os.getenv("POSTGRES_PASSWORD")
POSTGRES_HOST = os.getenv("POSTGRES_HOST")
POSTGRES_PORT = os.getenv("POSTGRES_PORT")
POSTGRES_DB = os.getenv("POSTGRES_DB")

POSTGRES_URL = "postgresql+asyncpg://{}:{}@{}:{}/{}".format(
    POSTGRES_USER,
    POSTGRES_PASSWORD,
    POSTGRES_HOST,
    POSTGRES_PORT,
    POSTGRES_DB,
)


# JWT
PUBLIC_KEY = str(os.getenv("PUBLIC_KEY"))

ALGORITHM = "HS256"


# PASSWORD HASHING
HASH_ALGORITHM = "sha256"

# RECOVERY PASSWORD
RESET_LINK = ""
MESSAGE_FOR_RECOVERY_PASSWORD = (
    """Перейди по ссылки для того чтобы сменить пароль: {RESET_LINK}"""
)
