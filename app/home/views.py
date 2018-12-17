# -*- coding:utf-8 -*-
from . import home
from app import db
from app.models import User

@home.route("/")
def index(): 
    user = User()
    user.uname = "尼古拉斯"
    user.upwd = "123456"
    user.uemail = "nigulasi@qq.com"
    user.uphone = "22222222222"
    db.session.add(user)
    db.session.commit()
    return "这里是首页!"