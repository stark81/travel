"""empty message

Revision ID: aa73c937f4b4
Revises: 
Create Date: 2018-12-24 20:56:12.607926

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'aa73c937f4b4'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('user',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('uname', sa.String(length=100), nullable=True),
    sa.Column('upwd', sa.String(length=100), nullable=True),
    sa.Column('uemail', sa.String(length=100), nullable=True),
    sa.Column('uphone', sa.String(length=11), nullable=True),
    sa.Column('uface', sa.String(length=255), nullable=True),
    sa.Column('addtime', sa.DateTime(), nullable=True),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('uemail'),
    sa.UniqueConstraint('uname'),
    sa.UniqueConstraint('uphone')
    )
    op.create_index(op.f('ix_user_addtime'), 'user', ['addtime'], unique=False)
    op.create_table('userlog',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('user_id', sa.Integer(), nullable=True),
    sa.Column('user_name', sa.String(length=100), nullable=True),
    sa.Column('ip', sa.String(length=100), nullable=True),
    sa.Column('addtime', sa.DateTime(), nullable=True),
    sa.ForeignKeyConstraint(['user_id'], ['user.id'], ),
    sa.ForeignKeyConstraint(['user_name'], ['user.uname'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_userlog_addtime'), 'userlog', ['addtime'], unique=False)
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_index(op.f('ix_userlog_addtime'), table_name='userlog')
    op.drop_table('userlog')
    op.drop_index(op.f('ix_user_addtime'), table_name='user')
    op.drop_table('user')
    # ### end Alembic commands ###
