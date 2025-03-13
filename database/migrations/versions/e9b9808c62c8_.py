"""empty message

Revision ID: e9b9808c62c8
Revises: f01e3ae17caf
Create Date: 2025-02-21 23:15:55.451540

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = 'e9b9808c62c8'
down_revision: Union[str, None] = 'f01e3ae17caf'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('rooms', sa.Column('rating', sa.Integer(), nullable=True))
    op.drop_column('rooms', 'raiting')
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('rooms', sa.Column('raiting', sa.INTEGER(), autoincrement=False, nullable=True))
    op.drop_column('rooms', 'rating')
    # ### end Alembic commands ###
