"""empty message

Revision ID: 6f3590e5e7a2
Revises: d188a6b18c98
Create Date: 2018-12-28 15:16:45.952814

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import mysql

# revision identifiers, used by Alembic.
revision = '6f3590e5e7a2'
down_revision = 'd188a6b18c98'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('user', sa.Column('isActive', sa.Boolean(), nullable=True))
    op.drop_column('user', 'uface')
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('user', sa.Column('uface', mysql.VARCHAR(length=255), nullable=True))
    op.drop_column('user', 'isActive')
    # ### end Alembic commands ###
