from . import admin
from app import db
from flask import render_template,flash,request,redirect,url_for,session
from werkzeug.security import generate_password_hash,check_password_hash
from functools import wraps

def admin_login(f):
    """
    登录装饰器
    """

    @wraps(f)
    def decorated_function(*args, **kwargs):
        if "admin" not in session:
            return "没有登录,这里是登陆页"
        return f(*args, **kwargs)
    return decorated_function

@admin.route("/")
# @admin_login
def admin_index():
    return render_template("admin/index.html")

@admin.route("/list")
def user_list():
    return render_template("admin/list.html")