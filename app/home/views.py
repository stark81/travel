from . import home
from app import db,FC_DIR,UP_DIR
from functools import wraps
from app.models import *
from app.home.forms import RegisterForm,LoginForm,InfoEditForm,SuggestForm
from flask import render_template,flash,request,redirect,url_for,session
from werkzeug.security import generate_password_hash,check_password_hash
from werkzeug.utils import secure_filename
import os,uuid,base64,json
from flask import jsonify
from app.admin.forms import AddTravelsForm
from sqlalchemy import and_,or_

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

## ===============首页=============== ##
@home.route("/")
def index(): 
    return redirect(url_for("home.tourism_sircle"))

## ===============旅游圈=============== ##
@home.route("/tourism_sircle")
def tourism_sircle():
    # 按时间倒叙，获取6条正常状态的游记
    travels = db.session.query(Travels).filter_by(isactive=1)\
        .order_by(Travels.addtime.desc()).limit(6).all()
    
    # 获取所有推荐景区
    scenics = db.session.query(Scenic).filter_by(is_recommend=1).all()
    return render_template("base/index.html",travels=travels,
    scenics=scenics)

## ===============获取评论数量=============== ##
@home.route("/getreviews")
def getreviews():
    # 根据游记id获取该游记的评论数量
    travel_id = request.args["travel_id"]
    review_count = Review.query.filter(Review.travels_id==\
        travel_id,Review.isactive==1).count()
    return str(review_count)

## ===============登出功能=============== ##
@home.route("/logout/")
def logout():
    # 获取登出前的url地址，如果没有返回‘/’，以便做‘从哪来回哪去’
    url = request.headers.get("Referer","/")
    resp = redirect(url)
    if "user_id" in session:
        del session["user_id"]
    if "uemail" in request.cookies:
        resp.delete_cookie("uemail")
    if "uid" in request.cookies:
        resp.delete_cookie("uid")
    return resp

## ===============登陆功能=============== ##
@home.route("/login/",methods=["GET","POST"])
def login():
    if request.method == "GET":
        url = request.headers.get("Referer","/")
        last = url.split("/")[-2]
        if last == "login":
            url = "/"
        session["url"] = url

        # 如果用户已经登陆，直接返回原来地址
        if "user_id" in session:
            return redirect(session["url"])
        
        # 如果传递过来的cookie中存在邮箱和uid，则直接进行验证
        if "uemail" in request.cookies and "uid" in request.cookies:
            user = User.query.filter_by(uemail=request.cookies.get("uemail")).first()
            if user and check_password_hash(request.cookies.get("uid"),str(user.id)):
                session["user_id"] = user.id
                userlog = Userlog(user.id,request.remote_addr) #验证通过之后,将用户登录的信息添加
                db.session.add(userlog)                    #到userlog表中,并将网页首页返回给用户
                db.session.commit()
                resp = redirect(session["url"])
                return resp

    form = LoginForm()
    if form.validate_on_submit():   #当点击登录时,验证登录规则并查看该邮箱是否已经注册
        user = User.query.filter_by(uemail=form.data["uemail"]).first()
        if not user:
            flash("邮箱未注册","err")
            return redirect(url_for("home.login"))
        if check_password_hash(user.upwd,form.data["upwd"]) is False:
            flash("密码不正确","err")
            return redirect(url_for("home.login"))
        
        session["user_id"] = user.id
        userlog = Userlog(user.id,request.remote_addr) #验证通过之后,将用户登录的信息添加
        db.session.add(userlog)                    #到userlog表中,并将网页首页返回给用户
        db.session.commit()
        url = session.get("url","/")
        resp = redirect(url)

        # 如果用户设置了保存密码，则将用户邮箱和用户id进行哈西加密后保存到cookie中
        if form.saveupwd.data:
            resp.set_cookie("uemail",form.data["uemail"],60*60*24*7)
            save_session = str(session["user_id"])
            upwd_hash = generate_password_hash(save_session)
            resp.set_cookie("uid",upwd_hash,60*60*24*7)
            return resp
        else:
            return resp
    return render_template("base/login.html",form=form)

## ===============注册功能=============== ##
@home.route("/register/",methods=["GET","POST"])
def register():
    # 获取url来源，并做好从哪来回哪去的准备
    if request.method == "GET":
        url = request.headers.get("Referer","/")
        session["url"] = url
        if "user_id" in session:
            del session["user_id"]

    form = RegisterForm()
    if form.validate_on_submit():
        data = form.data
        if data["username"] == "admin":     # 用户名不能为admin，如果是则返回错误提示
            flash("用户已存在","err")
            return redirect(url_for("home.register"))
        user = User(
            uname = data["username"],
            uemail = data["uemail"],
            upwd = generate_password_hash(data["upwd"])
            )
        user.cover = "default.png"
        db.session.add(user)
        db.session.commit()     # 将新注册用户写入数据库

        # 将新用户存入session中，并直接登陆
        user = User.query.filter_by(uname=data["username"]).first()
        session["user_id"] = user.id
        userlog = Userlog(user.id,request.remote_addr)
        db.session.add(userlog)
        db.session.commit()
        url = session.get("url","/")
        resp = redirect(url)
        return resp
    return render_template("base/register.html",form = form)

## ===============游记详情=============== ##
@home.route("/travels/info/<travel_id>")
def travels_info(travel_id):
    if "user_id" in session:    # 如果用户已经登陆，查询是否已经收藏游记
        is_collected = TravelsCollect.query.filter(TravelsCollect.travels_id==
            travel_id,TravelsCollect.user_id==session["user_id"]).count()
    else:
        is_collected = 0
    travel = Travels.query.filter(Travels.id==travel_id,Travels.isactive==1).first()
    return render_template("base/travels_info.html",travel=travel,
        is_collected=is_collected)

## ===============查看用户/游记列表=============== ##
@home.route("/userinfo/travel/<user_id>")
def userinfo(user_id):
    if "user_id" in session:    # 如果用户已登陆，查询用户与被查询用户是否为被关注关系
        is_friend = Friends.query.filter(Friends.focused_id==
            user_id,Friends.focuser_id==session["user_id"]).count()
    else:
        is_friend = 0
    user = User.query.filter_by(id=user_id).first()

    # 被查看用户的游记列表
    travels = Travels.query.filter(Travels.isactive==1,Travels.author_id==user_id).all()
    return render_template("base/userinfo.html",user=user,travels=travels,
        is_friend=is_friend)

## ===============修改用户资料=============== ##
@home.route("/info_edit")
@user_login
def info_edit():
    form = InfoEditForm()
    user = User.query.filter_by(id=session["user_id"]).first()
    return render_template("base/info_edit.html",user=user,form=form)

## ===============修改资料/用户姓名=============== ##
@home.route("/getunamepage")
@user_login
def getunamepage():
    user = User.query.filter_by(id=session["user_id"]).first()
    return render_template("base/uname.html",user=user)

## ===============修改资料/修改用户姓名=============== ##
@home.route("/postunamepage",methods=["POST"])
@user_login
def postunamepage():
    uname = request.form["uname"]
    user = User.query.filter_by(id=session["user_id"]).first()
    user.uname = uname
    db.session.add(user)
    db.session.commit()
    return render_template("base/uname.html",user=user)

## ===============修改资料/修改用户邮箱=============== ##
@home.route("/postemailpage",methods=["POST"])
@user_login
def postemailpage():
    uemail = request.form["uemail"]
    user = User.query.filter_by(id=session["user_id"]).first()
    user.uemail = uemail
    db.session.add(user)
    db.session.commit()
    return render_template("base/uemail.html",user=user)

## ===============修改资料/修改用户电话=============== ##
@home.route("/postphonepage",methods=["POST"])
@user_login
def postphonepage():
    uphone = request.form["uphone"]
    user = User.query.filter_by(id=session["user_id"]).first()
    user.uphone = uphone
    db.session.add(user)
    db.session.commit()
    return render_template("base/uphone.html",user=user)

## ===============修改资料/修改用户简介=============== ##
@home.route("/postintroducepage",methods=["POST"])
@user_login
def postintroducepage():
    introduce = request.form["introduce"]
    user = User.query.filter_by(id=session["user_id"]).first()
    user.introduce = introduce
    db.session.add(user)
    db.session.commit()
    return render_template("base/uintroduce.html",user=user)

## ===============修改资料/邮箱页面=============== ##
@home.route("/getuemailpage")
@user_login
def getuemailpage():
    user = User.query.filter_by(id=session["user_id"]).first()
    return render_template("base/uemail.html",user=user)

## ===============修改资料/电话子页面=============== ##
@home.route("/getuphonepage")
@user_login
def getuphonepage():
    user = User.query.filter_by(id=session["user_id"]).first()
    return render_template("base/uphone.html",user=user)

## ===============修改资料/简介子页面=============== ##
@home.route("/getintroducepage")
@user_login
def getintroducepage():
    user = User.query.filter_by(id=session["user_id"]).first()
    return render_template("base/uintroduce.html",user=user)

## ===============修改资料/修改用户名子页面=============== ##
@home.route("/getunamechangepage")
@user_login
def getunamechangepage():
    form = InfoEditForm()
    user = User.query.filter_by(id=session["user_id"]).first()
    form.username.data = user.uname
    return render_template("base/unamechange.html",user=user,form=form)

## ===============修改资料/修改用户邮箱子页面=============== ##
@home.route("/getemailchangepage")
@user_login
def getemailchangepage():
    form = InfoEditForm()
    user = User.query.filter_by(id=session["user_id"]).first()
    form.uemail.data = user.uemail
    return render_template("base/emailchange.html",user=user,form=form)

## ===============修改资料/修改用户电话子页面=============== ##
@home.route("/getphonechangepage")
@user_login
def getphonechangepage():
    form = InfoEditForm()
    user = User.query.filter_by(id=session["user_id"]).first()
    form.uphone.data = user.uphone
    return render_template("base/phonechange.html",user=user,form=form)

## ===============修改资料/修改用户简介子页面=============== ##
@home.route("/getintroducechangepage")
@user_login
def getintroducechangepage():
    form = InfoEditForm()
    user = User.query.filter_by(id=session["user_id"]).first()
    form.uintroduce.data = user.introduce
    return render_template("base/introducechange.html",user=user,form=form)

@home.route("/getusername")
def getusername():
    uid = request.args["uid"]
    user = User.query.filter_by(id = uid).first()
    user_name = user.uname
    return user_name

# =====================查看用户名是否已经存在========================
@home.route("/checkname")
def checkname():
    uname = request.args["user_name"]
    user_count = User.query.filter_by(uname=uname).count()
    return str(user_count)

# =====================查看邮箱是否已经存在========================
@home.route("/checkemail")
def checkemail():
    user_email = request.args["user_email"]
    user_count = User.query.filter_by(uemail=user_email).count()
    return str(user_count)

# =====================用户修改头像========================
@home.route("/postcover",methods=["POST"])
@user_login
def postcover():
    ucover = request.form["ucover"]     # 获取传来的图片十六进制信息
    ucover_type = request.form["ucover_type"]   # 获取用户图像的类型
    cover = base64.b64decode(ucover)    # 将十六进制图片信息转成二进制信息
    file_cover = secure_filename(ucover)    # 更改图片名称

    if not os.path.exists(FC_DIR):
        os.makedirs(FC_DIR)           
        os.chmod(FC_DIR,664)
        
    covername = change_filename(file_cover) + "."+ucover_type   # 图片的完整名称
    fileDIR = FC_DIR + covername    # 图片的保存地址
    try:
        with open(fileDIR,"wb") as f:
            f.write(cover)          # 将二进制信息写入图片中
        user = User.query.filter_by(id=session["user_id"]).first()
        user.cover = covername
        db.session.add(user)
        db.session.commit()
    except:
        return "err"
    return "ok"

## ===============获取用户头像=============== ##
@home.route("/getusercover")
def getusercover():
    authorid = request.args["uid"]
    user = User.query.filter_by(id=authorid).first()
    cover = user.cover
    return cover

## ===============获取游记评论=============== ##
@home.route("/gettravelreviews")
def gettravelreviews():
    travel_id = request.args["uid"]
    reviews = Review.query.filter(Review.travels_id==travel_id,
        Review.isactive==1).order_by(Review.addtime.desc()).all()
    return render_template("base/reviews.html",reviews=reviews)

## ===============用户书写游记评论=============== ##
@home.route("/userpostreviews",methods=["POST"])
@user_login
def userpostreviews():
    travel_id = request.form["travel_id"]
    review_content = request.form["review_content"]
    review = Review()
    review.travels_id = travel_id
    review.content = review_content
    review.user_id = session["user_id"]
    db.session.add(review)
    db.session.commit()
    reviews = Review.query.filter(Review.travels_id==travel_id,Review.isactive==1).order_by(Review.addtime.desc()).all()
    return render_template("base/reviews.html",reviews=reviews)

## ===============删除评论=============== ##
@home.route("/delreviews",methods=["POST"])
def delreviews():
    review_id = request.form["review_id"]
    travel_id =request.form["travel_id"]
    review = Review.query.filter_by(id=review_id).first()
    review.isactive = False
    db.session.add(review)
    db.session.commit()
    reviews = Review.query.filter(Review.travels_id==travel_id,
        Review.isactive==1).order_by(Review.addtime.desc()).all()
    return render_template("base/reviews.html",reviews=reviews)

## ===============景区详情展示=============== ##
@home.route("/showscenic/<scenic_id>")
def showscenic(scenic_id):
    scenic = Scenic.query.filter_by(id=scenic_id).first()   # 获取景区详情
    travels = Travels.query.filter(Travels.scenic_id==scenic_id,
        Travels.isactive==1).limit(5)           # 获取该景区的相关游记
    return render_template("base/scenic_info.html",scenic=scenic,travels=travels)

## ===============写游记=============== ##
@home.route("/writetravels",methods=["GET","POST"])
@user_login
def writetravels():
    form = AddTravelsForm()

    # 获取景区id和景区名，用于游记和景区的绑定
    form.scenic_id.choices = [(v.id, v.scenicname) for v in Scenic.query.all()]
    travels = Travels()
    form.submit.label.text = "发布"

    if form.validate_on_submit():
        data = form.data

        # 查看是否已存在同名游记
        travel_count = Travels.query.filter_by(title=data["title"]).count()
        if travel_count == 1:
            flash("已存在同名游记,请使用别的标题","err")
            return render_template("base/writetravels.html",form = form)
        
        # 保存游记的图片
        file_cover = secure_filename(form.cover.data.filename)
        if not os.path.exists(UP_DIR):
            os.makedirs(UP_DIR)           
            os.chmod(UP_DIR,664)
        cover = change_filename(file_cover) 
        form.cover.data.save(UP_DIR + cover)

        # 保存游记至数据库
        travels.author_id = session["user_id"]
        travels.title = data["title"]
        travels.scenic_id = data["scenic_id"]
        travels.cover = cover
        travels.content = data["content"]
        db.session.add(travels)
        db.session.commit()
        flash("发布游记成功","ok")
        return render_template("base/writetravels.html",form=form)
    return render_template("base/writetravels.html",form=form)

## ===============游记修改功能=============== ##
@home.route("/traveledit/<travel_id>",methods=["GET","POST"])
def traveledit(travel_id):
    form = AddTravelsForm()
    form.submit.label.text = "修改"
    form.scenic_id.choices = [(v.id, v.scenicname) for v in Scenic.query.all()]
    form.cover.validators = []      # 将游记封面的验证规则改为空
    travel = Travels.query.filter_by(id=travel_id).first()

    # 当请求方式为get时，把原来的游记信息填入表单中
    if request.method == "GET":
        form.title.data = travel.title
        form.is_recommend.data = travel.is_recommend
        form.scenic_id.data = travel.scenic_id
        form.cover.data = travel.cover
        form.content.data = travel.content
    
    # 当用户提交表单之后
    if form.validate_on_submit():
        data = form.data
        travels_count = Travels.query.filter_by(title=data["title"]).count()
        if travel.title != data["title"] and travels_count == 1:
            flash("游记已经存在","err")
            return render_template("base/traveledit.html",form=form)

        # 当存放封面的路径不存在时则创建
        if not os.path.exists(UP_DIR):
            os.makedirs(UP_DIR)           
            os.chmod(UP_DIR,664)

        # 当游记的封面数据不为空时，保存封面
        if form.cover.data != "":
            file_cover = secure_filename(form.cover.data.filename)     
            travel.cover = change_filename(file_cover)                       
            form.cover.data.save(UP_DIR + travel.cover)

        # 将修改好的游记保存至数据库
        travel.title = data["title"]
        travel.is_recommend = data["is_recommend"]
        travel.scenic_id = data["scenic_id"]
        travel.content = data["content"]

        db.session.add(travel)
        db.session.commit()
        flash("修改游记成功","ok")
        return render_template("base/traveledit.html",form=form)
    return render_template("base/traveledit.html",form=form)

## ===============加载地区=============== ##
@home.route("/loadarea")
def loadarea():
    areas = Area.query.all()
    lst1 = []
    for area in areas:
        lst1.append(area.to_dic())
    return json.dumps(lst1)

## ===============加载景区=============== ##
@home.route("/loadscenic")
def loadscenic():
    area_id = request.args["area_id"]
    scenics = Scenic.query.filter_by(area_id=area_id).all()
    lst1 = []
    for scenic in scenics:
        lst1.append(scenic.to_dic())
    return json.dumps(lst1)

## ===============收藏景区=============== ##
@home.route("/collecttravel",methods=["POST"])
@user_login
def collecttravel():
    travel_id = request.form["travel_id"]   # 获取被收藏的游记id
    travelscollect = TravelsCollect()
    travelscollect.user_id = session["user_id"]
    travelscollect.travels_id = travel_id
    db.session.add(travelscollect)
    db.session.commit()
    return "ok"

## ===============查看游记的收藏情况=============== ##
@home.route("/checktravelcollected")
@user_login
def checktravelcollected():
    travel_id = request.args["travel_id"]

    # 获取用户是否收藏该游记，如果是则返回1，否则返回0
    trvlcollect_count = TravelsCollect.query.filter(TravelsCollect.user_id==
        session["user_id"],TravelsCollect.travels_id==travel_id).count()
    return str(trvlcollect_count)

## ===============取消收藏游记=============== ##
@home.route("/cancelcollecttravel",methods=["POST"])
def cancelcollecttravel():
    travel_id = request.form["travel_id"]   # 获取被取消收藏的游记id
    trvlcollect = TravelsCollect.query.filter(TravelsCollect.user_id==
        session["user_id"],TravelsCollect.travels_id==travel_id).first()
    db.session.delete(trvlcollect)
    db.session.commit()
    return "ok"

## ===============删除游记=============== ##
@home.route("/deletetravel",methods=["POST"])
def deletetravel():
    travel_id = request.form["travel_id"]
    travel = Travels.query.filter(Travels.id==travel_id,
        Travels.author_id==session["user_id"]).first()  # 根据游记id和作者id获取游记
    travel.isactive = False
    db.session.add(travel)
    db.session.commit()
    return "删除游记成功！"

## ===============用户中心/评论列表=============== ##
@home.route("/userinfo/review/<user_id>")
def userinfo_review(user_id):
    if "user_id" in session:    # 如果用户已经登陆，查看用户与被查看者是否是关注关系
        is_friend = Friends.query.filter(Friends.focused_id
            ==user_id,Friends.focuser_id==session["user_id"]).count()
    else:
        is_friend = 0

    # 获取被查看用户的所有未被删除的评论
    reviews = Review.query.filter(Review.user_id==user_id,Review.isactive==True).all()
    user = User.query.filter_by(id=user_id).first()
    return render_template("base/userinfo_review.html",is_friend=is_friend,
        user=user,reviews=reviews)

## ===============全部景区=============== ##
@home.route("/allscenics/")
def allscenics():
    scenics = db.session.query(Scenic).filter_by(is_recommend=1).all()
    page = request.args.get('page', 1, type=int) # 获取page参数值 
    area = Area.query.all()    # 获取所有城市
    area_id = request.args.get('area_id',type=int)  # 地区
    star = request.args.get('star',type=int)        # 星级

    if area_id or star :    # 根据星级搜索景区
        filters = and_(Scenic.area_id==area_id,Scenic.star==star)
        page_data = Scenic.query.filter(filters).paginate(page=page, per_page=6)
    else :                  # 搜索全部景区    
        page_data = Scenic.query.paginate(page=page, per_page=3)
    return render_template("base/allscenic.html",scenics=scenics,
        page_data=page_data,area=area,area_id=area_id,star=star)

## ===============全部游记=============== ##
@home.route("/alltravels/")
def alltravels():
    travels = Travels.query.filter(Travels.isactive==1).all()   
    page = request.args.get('page', 1, type=int)    # 获取页数
    areaname = request.args.get("travelArea",type=str)  # 获取查询参数中的地区名
    scenic_name = request.args.get("travelScenic",type=str) # 获取参数中的景区名
    traveltitle = request.args.get("travelTitle",type=str)  # 获取参数中的游记标题
    travel_author = request.args.get("travelAuthor",type=str)  # 获取参数中的游记作者
        
    if areaname or scenic_name or traveltitle or travel_author:
        # 获取地区条件
        travelareas = Area.query.filter(Area.areaName.like("%"+areaname+"%")).all()
        travelareas_id = [v.id for v in travelareas]
        scenics = Scenic.query.filter(Scenic.area_id.in_(travelareas_id)).all()
        filter1 = and_(Travels.scenic_id.in_(v.id for v in scenics),
            Travels.isactive==1)
        
        # 获取景区条件
        travelscenics = Scenic.query.filter(Scenic.scenicname.like(
            "%"+scenic_name+"%")).all()
        filter2 = and_(Travels.scenic_id.in_(v.id for v in 
            travelscenics),Travels.isactive==1)
        
        # 获取游记标题
        filter3 = and_(Travels.title.like("%"+traveltitle+"%"),Travels.isactive==1)

        # 获取作者条件
        if travel_author:
            travelauthors = User.query.filter(User.uname.like(
                "%"+travel_author+"%")).all()
            filter4 = and_(Travels.author_id.in_(v.id for v in
                travelauthors),Travels.isactive==1)
        else:
            filter4 = and_( Travels.isactive == 1 )

        filters = and_(filter1,filter2,filter3,filter4)
        page_data = Travels.query.filter(filters).paginate(page=page, per_page=6)
        
    else :     # 搜索全部景区    
        page_data = Travels.query.filter_by(isactive=1).paginate(page=page, per_page=3)
    
    return render_template("base/alltravels.html",page_data=page_data,travels=travels)

## ===============用户中心/删除评论=============== ##
@home.route("/userinfdeletereviews",methods=["POST"])
@user_login
def userinfdeletereviews():
    review_id = request.form["review_id"]   # 获取要删除的评论id
    review = Review.query.filter(Review.id==review_id,
        Review.user_id==session["user_id"]).first() # 根据评论id和评论者id查询到该评论
    review.isactive = False
    db.session.add(review)
    db.session.commit()
    return "删除评论成功！"

## ===============关于我们=============== ##
@home.route("/aboutus",methods=["GET","POST"])
def aboutus():
    form = SuggestForm()

    # 用户提交意见建议
    if form.validate_on_submit():
        data = form.data
        suggest = Suggest()
        suggest.uname = data["uname"]
        suggest.uemail = data["email"]
        suggest.content = data["advice"]
        db.session.add(suggest)
        db.session.commit()
        flash("提交成功！谢谢您的意见。","ok")
    return render_template("base/aboutus.html",form=form)

## ===============用户中心/游记收藏=============== ##
@home.route("/userinfo/travelscollect/<user_id>")
def travel_collect(user_id):
    user = User.query.filter_by(id=user_id).first() # 获取被查看者信息
    if "user_id" in session:    # 如果用户已经登陆，查看用户与被查看者是否为关注关系
        is_friend = Friends.query.filter(Friends.focused_id==user_id,
            Friends.focuser_id==session["user_id"]).count()
    else:
        is_friend = 0
    travelcollects = TravelsCollect.query.filter(TravelsCollect.user_id==user_id).all()
    travel_ids = [ v.travels_id for v in travelcollects ]
    travels = Travels.query.filter(Travels.id.in_(travel_ids),Travels.isactive==1).all()
    return render_template("base/travel_collect.html",user=user,travels=travels,is_friend=is_friend)

## ===============取消关注=============== ##
@home.route("/lost_focus",methods=["POST"])
@user_login
def lost_focus():
    focus_id = request.form["focus_id"] # 获取被取关者id
    lost_friend = Friends.query.filter(Friends.focused_id==focus_id,
        Friends.focuser_id==session["user_id"]).first()
    db.session.delete(lost_friend)
    db.session.commit()
    return "ok"

## ===============关注用户=============== ##
@home.route("/get_focus",methods=["POST"])
@user_login
def get_focus():
    focus_id = request.form["focus_id"]     # 获取被关注者id
    friends = Friends()
    friends.focused_id = focus_id
    friends.focuser_id = session["user_id"]
    db.session.add(friends)
    db.session.commit()
    return "ok"

## ===============用户中心/关注列表=============== ##
@home.route("/userinfo/focus/<user_id>")
def user_focus(user_id):
    if "user_id" in session:    # 查看用户与被查看用户是否为被关注关系
        is_friend = Friends.query.filter(Friends.focused_id==user_id,
            Friends.focuser_id==session["user_id"]).count()
    else:
        is_friend = 0

    be_focus = Friends.query.filter_by(focuser_id=user_id).all()    # 获取被查看者的所有关注
    focused_ids = [v.focused_id for v in be_focus]
    user = User.query.filter_by(id=user_id).first()
    friends = User.query.filter(User.id.in_(focused_ids)).all()
    return render_template("base/focus.html",friends=friends,user=user,is_friend=is_friend)

## ===============用户中心/关注/获取游记数量=============== ##
@home.route("/gettravelnums")
def gettravelnums():
    checkuserid = request.args["getuserid"]
    count = Travels.query.filter(Travels.author_id==checkuserid,Travels.isactive==1).count()
    return str(count)

## ===============用户中心/关注/获取用户评论数量=============== ##
@home.route("/getuserreviewnums")
def getuserreviewnums():
    checkuserid = request.args["getuserid"]
    count = Review.query.filter(Review.user_id==checkuserid,Review.isactive==1).count()
    return str(count)

## ===============用户中心/关注/获取粉丝数量=============== ##
@home.route("/getuserfocusers")
def getuserfocusers():
    checkuserid = request.args["getuserid"]
    count = Friends.query.filter(Friends.focused_id==checkuserid).count()
    return str(count)

## ===============用户中心/关注/是否为关注=============== ##
@home.route("/check_is_friend")
def check_is_friend():
    focus_id = request.args["focus_id"]
    if "user_id" in session:
        is_friend = Friends.query.filter(Friends.focused_id==focus_id,
            Friends.focuser_id==session['user_id']).count()
    else:
        is_friend = 0
    return str(is_friend)

## ===============留言功能=============== ##
@home.route("/domessage",methods=["POST"])
@user_login
def domessage():
    receiver_id = request.form["user_id"]   # 接收者id
    content = request.form["content"]       # 留言内容
    message = Message()
    message.receiver_id = receiver_id
    message.content = content
    message.send_id = session["user_id"]    # 发送者id
    db.session.add(message)
    db.session.commit()
    return "发送留言成功！"

## ===============用户中心/留言=============== ##
@home.route("/userinfo/message/<user_id>")
def message(user_id):
    user = User.query.filter_by(id=user_id).first()
    if "user_id" in session:
        is_friend = Friends.query.filter(Friends.focused_id==user_id,
            Friends.focuser_id==session["user_id"]).count()
    else:
        is_friend = 0

    messages = Message.query.filter(Message.receiver_id==user_id,
        Message.isalive==1).order_by(Message.is_read,Message.addtime.desc()).all()
    send_ids = [v.send_id for v in messages]
    senders = User.query.filter(User.id.in_(send_ids)).all()
    return render_template("base/message.html",user=user,is_friend=is_friend,
        messages=messages,senders=senders)

## ===============删除留言=============== ##
@home.route("/delmessage",methods=["POSt"])
def delmessage():
    message_id = request.form["message_id"]     # 被删除留言id
    message = Message.query.filter_by(id=message_id).first()    # 根据id查询留言信息
    message.isalive = 0     # 将留言的状态改为被删除
    db.session.add(message)
    db.session.commit()
    return "ok"

## ===============将留言标记为已读=============== ##
@home.route("/mark_as_read",methods=["POST"])
def mark_as_read():
    message_id = request.form["message_id"]
    message = Message.query.filter(Message.id==message_id).first()
    message.is_read = 1
    db.session.add(message)
    db.session.commit()
    return "ok"

## ===============获取围堵留言数量=============== ##
@home.route("/getunreadcount")
def getunreadcount():
    if "user_id" in session:
        receiver_id = session["user_id"]
        message_count = Message.query.filter(Message.receiver_id==receiver_id,Message.is_read==0).count()
        return str(message_count)
    else:
        return "0"

## ===============搜索用户=============== ##
@home.route("/getuser")
def getuser():
    username = request.args["username"]
    if username:
        users = User.query.filter(User.uname.like("%"+username+"%")).all()
        nameList = []
        for user in users:
            dic = {user.id:user.uname}
            nameList.append(dic)
        return jsonify(nameList)
    else:
        return "err"



# 设置ck编辑器相关配置
def gen_rnd_filename():
    return datetime.now().strftime("%Y%m%d%H%M%S") + str(uuid.uuid4().hex)

def change_filename(filename):
    """
    修改文件名称
    """
    fileinfo = os.path.splitext(filename)
    filename =  gen_rnd_filename() + fileinfo[-1]
    return filename


# @home.route('/ckupload/', methods=['POST', 'OPTIONS'])
# @user_login
# def ckupload():
#     """CKEditor 文件上传"""
#     error = ''
#     url = ''
#     callback = request.args.get("CKEditorFuncNum")

#     if request.method == 'POST' and 'upload' in request.files:
#         fileobj = request.files['upload']
#         fname, fext = os.path.splitext(fileobj.filename)
#         rnd_name = '%s%s' % (gen_rnd_filename(), fext)

#         filepath = os.path.join(current_app.static_folder, 'uploads/ckeditor', rnd_name)
#         # 检查路径是否存在，不存在则创建
#         dirname = os.path.dirname(filepath)
#         if not os.path.exists(dirname):
#             try:
#                 os.makedirs(dirname)
#             except:
#                 error = 'ERROR_CREATE_DIR'
#         elif not os.access(dirname, os.W_OK):
#             error = 'ERROR_DIR_NOT_WRITEABLE'

#         if not error:
#             fileobj.save(filepath)
#             url = url_for('static', filename='%s/%s' % ('uploads/ckeditor', rnd_name))
#     else:
#         error = 'post error'

#     res = """<script type="text/javascript">
#   window.parent.CKEDITOR.tools.callFunction(%s, '%s', '%s');
# </script>""" % (callback, url, error)

#     response = make_response(res)
#     response.headers["Content-Type"] = "text/html"
#     return response
