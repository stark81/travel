# -*- coding:utf-8 -*-
from flask_wtf import FlaskForm,
from wtforms import StringField,PasswordField,SubmitField
from wtforms.validators import DataRequired,Email,EqualTo

class RegisterForm(FlaskForm):
    username = StringField(
        label="用户名",
        validators=[
            DataRequired("用户名不能为空!"),
        ],
        render_kw=[
            "placeholder":"请输入用户名"
        ]      
    )
    upwd = PasswordField(
        label="密码",
        validators=[],
        render_kw=[]
    )