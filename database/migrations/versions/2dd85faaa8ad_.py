"""empty message

Revision ID: 2dd85faaa8ad
Revises: a03e65fb8470
Create Date: 2025-02-21 22:48:09.527435

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '2dd85faaa8ad'
down_revision: Union[str, None] = 'a03e65fb8470'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('rooms', sa.Column('preview', sa.String(), nullable=True))
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('rooms', 'preview')
    # ### end Alembic commands ###
