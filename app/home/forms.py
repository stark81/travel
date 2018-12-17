# -*- coding:utf-8 -*-
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, FileField, TextAreaField
from wtforms.validators import DataRequired, Email, Regexp, EqualTo, ValidationError,Length
from app.models import User

class RegisterForm(FlaskForm):
    username = StringField(
        description="用户名",
        validators=[
            DataRequired("用户名不能为空!"),
        ],
        render_kw={
            "placeholder":"请输入用户名"
        }      
    )
    uemail = StringField(
        description="邮箱",
        validators=[
            DataRequired("邮箱地址不能为空!"),
            Email("邮箱地址不正确")
        ],
        render_kw={
            "placeholder":"请输入邮箱"
        }
    )
    upwd = PasswordField(
        description="密码",
        validators=[
            DataRequired("密码不能为空!"),
            Length(6,20,"密码长度在6~20位之间")
        ],
        render_kw={
            "placeholder":"请输入密码"
        }
    )
    repwd = PasswordField(
        description="确认密码",
        validators=[
            DataRequired("请输入确认密码!"),
            EqualTo("upwd","两次密码不一致!"),
        ],
        render_kw={"placeholder":"请输入确认密码"}
    )
    submit = SubmitField(
        "注册",
        render_kw={
            "class": "btn btn-primary",
        }
    )
    def validate_email(self,field):
        uemail = field.data
        user = User.query.filter_by(uemail=uemail).count()
        if user == 1:
            raise ValidationError("邮箱已经存在！")