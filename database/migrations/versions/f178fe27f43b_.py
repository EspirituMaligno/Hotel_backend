"""empty message

Revision ID: f178fe27f43b
Revises: af6a4cfe429d
Create Date: 2025-03-13 10:54:39.922857

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = 'f178fe27f43b'
down_revision: Union[str, None] = 'af6a4cfe429d'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('rooms', sa.Column('is_breakfast', sa.Boolean(), nullable=True))
    op.add_column('rooms', sa.Column('is_biometry_key', sa.Boolean(), nullable=True))
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('rooms', 'is_biometry_key')
    op.drop_column('rooms', 'is_breakfast')
    # ### end Alembic commands ###
