"""empty message

Revision ID: 462be2c6b95f
Revises: 612c2b0d3d04
Create Date: 2025-04-07 10:31:55.106163

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '462be2c6b95f'
down_revision: Union[str, None] = '612c2b0d3d04'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('rooms_images')
    op.add_column('rooms', sa.Column('name', sa.String(), nullable=True))
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('rooms', 'name')
    op.create_table('rooms_images',
    sa.Column('id', sa.INTEGER(), autoincrement=True, nullable=False),
    sa.Column('room_id', sa.INTEGER(), autoincrement=False, nullable=False),
    sa.Column('image', sa.VARCHAR(), autoincrement=False, nullable=False),
    sa.ForeignKeyConstraint(['room_id'], ['rooms.id'], name='rooms_images_room_id_fkey'),
    sa.PrimaryKeyConstraint('id', name='rooms_images_pkey')
    )
    # ### end Alembic commands ###
