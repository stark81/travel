from . import home
from app import db
from app.models import User
from app.home.forms import RegisterForm,LoginForm
from flask import render_template,flash,request
from werkzeug.security import generate_password_hash,check_password_hash

@home.route("/")
def index(): 
    return render_template("base/index.html")

@home.route("/login/",methods=["GET","POST"])
def login():
    form = LoginForm()
    return render_template("base/login.html",form=form)

@home.route("/register/",methods=["GET","POST"])
def register():
    form = RegisterForm()
    if form.validate_on_submit():
        data = form.data
        uname = data["username"]
        uemail = data["uemail"]
        upwd =generate_password_hash(data["upwd"]) 
        user = User(uname,uemail,upwd)
        db.session.add(user)
        db.session.commit()
        flash("注册成功","ok")
    return render_template("base/register.html",form = form)
    