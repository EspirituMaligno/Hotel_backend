from datetime import date, datetime, timedelta, time, timezone

from sqlalchemy import DateTime, ForeignKey, Text, desc, select
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import mapped_column, Mapped, relationship

Base = declarative_base()


class Users(Base):
    __tablename__ = "users"

    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(nullable=False)
    surname: Mapped[str] = mapped_column(nullable=False)
    birth_date: Mapped[date] = mapped_column(nullable=False)
    email: Mapped[str] = mapped_column(nullable=False)
    password_hash: Mapped[str] = mapped_column(nullable=False)
    role: Mapped[str] = mapped_column(nullable=False, default="user")
    time_zone: Mapped[str] = mapped_column(nullable=False)
    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True), nullable=True, default=datetime.now(timezone.utc)
    )
    is_active: Mapped[bool] = mapped_column(nullable=False, default=True)


class Rooms(Base):
    __tablename__ = "rooms"

    id: Mapped[int] = mapped_column(primary_key=True)
    preview: Mapped[str] = mapped_column(nullable=True)
    name: Mapped[str] = mapped_column(nullable=True)
    description: Mapped[str] = mapped_column(nullable=True)
    room_count: Mapped[int] = mapped_column(nullable=False)
    count_of_people: Mapped[int] = mapped_column(nullable=True)
    price: Mapped[float] = mapped_column(nullable=False)
    rating: Mapped[int] = mapped_column(nullable=True, default=0)
    is_noisecancelling: Mapped[bool] = mapped_column(nullable=True)
    is_wifi: Mapped[bool] = mapped_column(nullable=True)
    is_pc: Mapped[bool] = mapped_column(nullable=True)
    is_breakfast: Mapped[bool] = mapped_column(nullable=True)
    is_biometry_key: Mapped[bool] = mapped_column(nullable=True)
    is_tv: Mapped[bool] = mapped_column(nullable=True)


class Reservation(Base):
    __tablename__ = "reservation"

    id: Mapped[int] = mapped_column(primary_key=True)
    user_id: Mapped[int] = mapped_column(ForeignKey("users.id"))
    room_id: Mapped[int] = mapped_column(ForeignKey("rooms.id"))
    start_date: Mapped[date] = mapped_column(nullable=False)
    end_date: Mapped[date] = mapped_column(nullable=False)
    count_nights: Mapped[int] = mapped_column(nullable=False)
    price: Mapped[float] = mapped_column(nullable=False)

    room = relationship("Rooms")


class Reviews(Base):
    __tablename__ = "reviews"

    id: Mapped[int] = mapped_column(primary_key=True)
    user_id: Mapped[int] = mapped_column(ForeignKey("users.id"))
    room_id: Mapped[int] = mapped_column(ForeignKey("rooms.id"))
    text: Mapped[str] = mapped_column(nullable=False)
    rating: Mapped[int] = mapped_column(nullable=False)
    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True), nullable=False, default=datetime.now(timezone.utc)
    )
