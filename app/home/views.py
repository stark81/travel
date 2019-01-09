from . import home
from app import db
from app.models import User,Userlog,Travels,Scenic,Review
from app.home.forms import RegisterForm,LoginForm,InfoEditForm
from flask import render_template,flash,request,redirect,url_for,session
from werkzeug.security import generate_password_hash,check_password_hash

def user_login(f):
    """
    登录装饰器
    """
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if "user_id" not in session:
            return redirect(url_for("home.login"))
        return f(*args, **kwargs)

    return decorated_function

@home.route("/")
def index(): 
    return redirect(url_for("home.tourism_sircle"))

@home.route("/tourism_sircle")
def tourism_sircle():
    travels = db.session.query(Travels).filter_by(isactive=1).all()
    scenics = db.session.query(Scenic).all()
    reviews = db.session.query(Review).all()
    return render_template("base/index.html",travels=travels,
    scenics=scenics,reviews=reviews)

@home.route("/getreviews")
def getreviews():
    travel_id = request.args["travel_id"]
    review_count = Review.query.filter(Review.travels_id==travel_id,Review.isactive==1).count()
    return str(review_count)

@home.route("/logout/")
def logout():
    url = request.headers.get("Referer","/")
    resp = redirect(url)
    if "user_name" in session:
        del session["user_id"]
        del session["user_name"]
    if "user_name" in request.cookies:
        resp.delete_cookie("user_name")
    return resp
    # return redirect(url_for("home.login"))

@home.route("/login/",methods=["GET","POST"])
def login():
    if request.method == "GET":
        url = request.headers.get("Referer","/")
        session["url"] = url
        if "user_id" in session:
            return redirect(session["url"])
        
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
        session["user_id"] = user.id
        userlog = Userlog(user.id,request.remote_addr) #验证通过之后,将用户登录的信息添加
        db.session.add(userlog)                    #到userlog表中,并将网页首页返回给用户
        db.session.commit()
        url = session.get("url","/")
        resp = redirect(url)
        
        return resp
    return render_template("base/login.html",form=form)

@home.route("/register/",methods=["GET","POST"])
def register():
    if request.method == "GET":
        del session["user_id"]
        url = request.headers.get("Referer","/")
        session["url"] = url
    form = RegisterForm()
    if form.validate_on_submit():
        data = form.data
        if data["username"] == "admin":
            flash("用户已存在","err")
            return redirect(url_for("home.register"))
        user = User(
            uname = data["username"],
            uemail = data["uemail"],
            upwd = generate_password_hash(data["upwd"])
            )
        session["user_id"] = user.id
        session["user_name"] = user.uname
        db.session.add(user)
        db.session.commit()
        url = session.get("url","/")
        resp = redirect(url)
        return resp
    return render_template("base/register.html",form = form)

@home.route("/travels/info/<travel_id>")
def travels_info(travel_id):
    travel = Travels.query.filter_by(id=travel_id).first()
    return render_template("base/travels_info.html",travel=travel)

@home.route("/userinfo/<user_id>")
def userinfo(user_id):
    user = User.query.filter_by(id=user_id).first()
    return render_template("base/userinfo.html",user=user)

@home.route("/info_edit/<user_id>",methods=["GET","POST"])
def info_edit(user_id):
    form = InfoEditForm()
    user = User.query.filter_by(id=user_id).first()
    return render_template("base/info_edit.html",user=user,form=form)

@home.route("/getunamepage")
def getunamepage():
    uid = request.args["uid"]
    user = User.query.filter_by(id=uid).first()
    return render_template("base/uname.html",user=user)

@home.route("/getuemailpage")
def getuemailpage():
    uid = request.args["uid"]
    user = User.query.filter_by(id=uid).first()
    return render_template("base/uemail.html",user=user)

@home.route("/getuphonepage")
def getuphonepage():
    uid = request.args["uid"]
    user = User.query.filter_by(id=uid).first()
    return render_template("base/uphone.html",user=user)

@home.route("/getintroducepage")
def getintroducepage():
    uid = request.args["uid"]
    user = User.query.filter_by(id=uid).first()
    return render_template("base/uintroduce.html",user=user)

@home.route("/getunamechangepage")
def getunamechangepage():
    form = InfoEditForm()
    uid = request.args["uid"]
    user = User.query.filter_by(id=uid).first()
    if request.method == "GET":
        form.username.data = user.uname
    return render_template("base/unamechange.html",user=user,form=form)

@home.route("/getemailchangepage")
def getemailchangepage():
    form = InfoEditForm()
    uid = request.args["uid"]
    user = User.query.filter_by(id=uid).first()
    if request.method == "GET":
        form.uemail.data = user.uemail
    return render_template("base/emailchange.html",user=user,form=form)

@home.route("/getphonechangepage")
def getphonechangepage():
    form = InfoEditForm()
    uid = request.args["uid"]
    user = User.query.filter_by(id=uid).first()
    if request.method == "GET":
        form.uphone.data = user.uphone
    return render_template("base/phonechange.html",user=user,form=form)

@home.route("/getintroducechangepage")
def getintroducechangepage():
    form = InfoEditForm()
    uid = request.args["uid"]
    user = User.query.filter_by(id=uid).first()
    if request.method == "GET":
        form.uintroduce.data = user.introduce
    return render_template("base/introducechange.html",user=user,form=form)