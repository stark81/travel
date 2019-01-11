# -*- coding:utf-8 -*-
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask import Blueprint
import os

app = Flask(__name__)
app.config['DEBUG'] = True
app.config["SECRET_KEY"] = 'mrsoft'
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://root:123456@127.0.0.1:3306/travel"
track_modifications = app.config.setdefault('SQLALCHEMY_TRACK_MODIFICATIONS', False)
db = SQLAlchemy(app)

UP_DIR = os.path.join(os.path.abspath(os.path.dirname(__file__)), "static/uploads/")  # 文件上传路径
FC_DIR = os.path.join(os.path.abspath(os.path.dirname(__file__)), "static/uploads/user/")  # 用户头像上传路径

from app.home import home as home_blueprint
from app.admin import admin as admin_blueprint

app.register_blueprint(home_blueprint)
app.register_blueprint(admin_blueprint,url_prefix="/admin")