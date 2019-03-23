"""empty message

Revision ID: ad34a1f59122
Revises: e970715e7989
Create Date: 2019-01-14 20:31:29.805177

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'ad34a1f59122'
down_revision = 'e970715e7989'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('travels', sa.Column('isdrafts', sa.Boolean(), nullable=True))
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('travels', 'isdrafts')
    # ### end Alembic commands ###