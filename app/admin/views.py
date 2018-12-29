from . import admin
from app import db
from app.models import *
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
    page = request.args.get('page', 1, type=int)
    page_data = User.query.order_by(
            User.addtime.desc()
        ).paginate(page=page, per_page=7)
    return render_template("admin/list.html", page_data=page_data)

@admin.route("/userloginlog")
def userLoginLog():
    page = request.args.get('page', 1, type=int)
    page_data = Userlog.query.order_by(
            Userlog.addtime.desc()
        ).paginate(page=page, per_page=7)
    return render_template("admin/userloginlog.html", page_data=page_data)

@admin.route("/addarea",methods=["GET","POST"])
def addarea():
    if request.method == "POST":
        return "ok!"
    return render_template("admin/addarea.html")