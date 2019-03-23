"""empty message

Revision ID: e4fdf6777aa8
Revises: b724e7844c7a
Create Date: 2019-01-02 20:34:43.653550

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'e4fdf6777aa8'
down_revision = 'b724e7844c7a'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('travels', sa.Column('addtime', sa.DateTime(), nullable=True))
    op.create_index(op.f('ix_travels_addtime'), 'travels', ['addtime'], unique=False)
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_index(op.f('ix_travels_addtime'), table_name='travels')
    op.drop_column('travels', 'addtime')
    # ### end Alembic commands ###
