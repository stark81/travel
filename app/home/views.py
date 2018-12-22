from . import home
from app import db
from app.models import User
from app.home.forms import RegisterForm,LoginForm
from flask import render_template,flash,request,redirect,url_for
from werkzeug.security import generate_password_hash,check_password_hash

@home.route("/")
def index(): 
    return render_template("base/index.html")

@home.route("/login/",methods=["GET","POST"])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        user = User.query.filter_by(uemail=form.data["uemail"]).first()
        if not user:
            flash("邮箱未注册","err")
            return redirect(url_for("home.login"))
        if check_password_hash(user.upwd,form.data["upwd"]) is False:
            flash("密码不正确","err")
            return redirect(url_for("home.login"))
        return redirect(url_for("home.index"))
    return render_template("base/login.html",form=form)

@home.route("/register/",methods=["GET","POST"])
def register():
    form = RegisterForm()
    if form.validate_on_submit():
        data = form.data
        user = User(
            uname = data["username"],
            uemail = data["uemail"],
            upwd = generate_password_hash(data["upwd"])
            )
        db.session.add(user)
        db.session.commit()
        flash("注册成功","ok")
    return render_template("base/register.html",form = form)
    