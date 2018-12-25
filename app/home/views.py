from . import home
from app import db
from app.models import User,Userlog
from app.home.forms import RegisterForm,LoginForm
from flask import render_template,flash,request,redirect,url_for,session
from werkzeug.security import generate_password_hash,check_password_hash

@home.route("/")
def index(): 
    return render_template("base/index.html")

@home.route("/logout/")
def logout():
    session.pop("user_name",None)
    return redirect(url_for("home.login"))

@home.route("/login/",methods=["GET","POST"])
def login():
    form = LoginForm()
    if form.validate_on_submit():   #当点击登录时,验证登录规则并查看该邮箱是否已经注册
        user = User.query.filter_by(uemail=form.data["uemail"]).first()
        if not user:
            flash("邮箱未注册","err")
            return redirect(url_for("home.login"))
        if check_password_hash(user.upwd,form.data["upwd"]) is False:
            flash("密码不正确","err")
            return redirect(url_for("home.login"))

        session["user_name"] = user.uname   
        userlog = Userlog(user.id,request.remote_addr) #验证通过之后,将用户登录的信息添加
        db.session.add(userlog)                    #到userlog表中,并将网页首页返回给用户
        db.session.commit()
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
    