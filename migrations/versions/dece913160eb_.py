"""empty message

Revision ID: dece913160eb
Revises: 9cce0898d696
Create Date: 2019-01-04 10:50:36.074639

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'dece913160eb'
down_revision = '9cce0898d696'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('review', sa.Column('isactive', sa.Boolean(), nullable=True))
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('review', 'isactive')
    # ### end Alembic commands ###
