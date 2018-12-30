from . import admin
from app import db
from app.models import *
from flask import render_template,flash,request,redirect,url_for,session
from werkzeug.security import generate_password_hash,check_password_hash
from functools import wraps
from app.admin.forms import AddAreaForm

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
def index():
    return redirect(url_for("admin.admin_index"))

@admin.route("/index/firstpage")
# @admin_login
def admin_index():
    return render_template("admin/index.html")

@admin.route("/user/userlist")
def user_list():
    page = request.args.get('page', 1, type=int)
    page_data = User.query.order_by(
            User.addtime.desc()
        ).paginate(page=page, per_page=6)
    return render_template("admin/list.html", page_data=page_data)

@admin.route("/log/userloginlog")
def userLoginLog():
    page = request.args.get('page', 1, type=int)
    page_data = Userlog.query.order_by(
            Userlog.addtime.desc()
        ).paginate(page=page, per_page=6)
    return render_template("admin/userloginlog.html", page_data=page_data)

@admin.route("/area/addarea",methods=["GET","POST"])
def addarea():
    form = AddAreaForm()
    if form.validate_on_submit():
        data = form.data
        area = db.session.query(Area).filter(Area.areaName==data["sname"]).count()
        if area:
            flash("地区已存在","err")
            return redirect(url_for("admin.addarea"))
        else:
            area = Area()
            area.areaName = data["sname"]
            area.is_recommend = data["is_recommend"]
            area.introduce = data["introduce"]
            db.session.add(area)
            db.session.commit()
            flash("添加成功","ok")
    return render_template("admin/addarea.html",form=form)

@admin.route("/area/arealist",methods=["GET","POST"])
def arealist():
    page = request.args.get('page', 1, type=int)
    page_data = Area.query.order_by(
            Area.addtime.desc()
        ).paginate(page=page, per_page=6)
    return render_template("admin/arealist.html",page_data=page_data)

@admin.route("/area/arealist/edit/<area_id>",methods=["GET","POST"])
def areaEdit(area_id=None):
    form = AddAreaForm()
    area = Area.query.get_or_404(area_id)
    if request.method == "GET":
        form.sname.data = area.areaName
        form.is_recommend.data = area.is_recommend
        form.introduce.data = area.introduce
    if form.validate_on_submit():
        data = form.data
        area_count = db.session.query(Area).filter(Area.areaName==data["sname"]).count()
        if area.areaName != data["sname"] and area_count == 1:
            flash("地区已存在","err")
            return redirect(url_for("admin.areaEdit",area_id=area.id))
        area.areaName = data["sname"]
        area.is_recommend = data["is_recommend"]
        area.introduce = data["introduce"]
        db.session.add(area)
        db.session.commit()
        flash("修改成功","ok")
        return redirect(url_for("admin.areaEdit",area_id=area.id))
    return render_template("admin/areachange.html",form=form)

@admin.route("/user/suggest")
def suggest():
    page = request.args.get('page', 1, type=int)
    page_data = Suggest.query.order_by(
            Suggest.addtime.desc()
        ).paginate(page=page, per_page=6)
    return render_template("admin/suggestion.html",page_data=page_data)

