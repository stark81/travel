from . import home
from app import db,FC_DIR,UP_DIR
from functools import wraps
from app.models import *
from app.home.forms import RegisterForm,LoginForm,InfoEditForm
from flask import render_template,flash,request,redirect,url_for,session
from werkzeug.security import generate_password_hash,check_password_hash
from werkzeug.utils import secure_filename
import os,uuid,base64,json
from app.admin.forms import AddTravelsForm

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
    travels = db.session.query(Travels).filter_by(isactive=1).order_by(Travels.addtime.desc()).limit(6).all()
    scenics = db.session.query(Scenic).all()
    return render_template("base/index.html",travels=travels,
    scenics=scenics)

@home.route("/getreviews")
def getreviews():
    travel_id = request.args["travel_id"]
    review_count = Review.query.filter(Review.travels_id==travel_id,Review.isactive==1).count()
    return str(review_count)

@home.route("/logout/")
def logout():
    url = request.headers.get("Referer","/")
    resp = redirect(url)
    if "user_id" in session:
        del session["user_id"]
    return resp

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
        url = request.headers.get("Referer","/")
        session["url"] = url
        if "user_id" in session:
            del session["user_id"]

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
        user.cover = "default.png"
        db.session.add(user)
        db.session.commit()
        user = User.query.filter_by(uname=data["username"]).first()
        session["user_id"] = user.id
        userlog = Userlog(user.id,request.remote_addr)
        db.session.add(userlog)                    #到userlog表中,并将网页首页返回给用户
        db.session.commit()
        url = session.get("url","/")
        resp = redirect(url)
        return resp
    return render_template("base/register.html",form = form)


@home.route("/travels/info/<travel_id>")
def travels_info(travel_id):
    travel = Travels.query.filter(Travels.id==travel_id,Travels.isactive==1).first()
    return render_template("base/travels_info.html",travel=travel)

@home.route("/userinfo/travel/<user_id>")
def userinfo(user_id):
    user = User.query.filter_by(id=user_id).first()
    travels = Travels.query.filter(Travels.isactive==1,Travels.author_id==user_id).all()
    return render_template("base/userinfo.html",user=user,travels=travels)


@home.route("/info_edit/<user_id>",methods=["GET","POST"])
@user_login
def info_edit(user_id):
    form = InfoEditForm()
    user = User.query.filter_by(id=user_id).first()
    return render_template("base/info_edit.html",user=user,form=form)

@home.route("/getunamepage")
def getunamepage():
    uid = request.args["uid"]
    user = User.query.filter_by(id=uid).first()
    return render_template("base/uname.html",user=user)

@home.route("/postunamepage",methods=["POST"])
def postunamepage():
    uid = request.form["uid"]
    uname = request.form["uname"]
    user = User.query.filter_by(id=uid).first()
    user.uname = uname
    db.session.add(user)
    db.session.commit()
    return render_template("base/uname.html",user=user)

@home.route("/postemailpage",methods=["POST"])
def postemailpage():
    uid = request.form["uid"]
    uemail = request.form["uemail"]
    user = User.query.filter_by(id=uid).first()
    user.uemail = uemail
    db.session.add(user)
    db.session.commit()
    return render_template("base/uemail.html",user=user)

@home.route("/postphonepage",methods=["POST"])
def postphonepage():
    uid = request.form["uid"]
    uphone = request.form["uphone"]
    user = User.query.filter_by(id=uid).first()
    user.uphone = uphone
    db.session.add(user)
    db.session.commit()
    return render_template("base/uphone.html",user=user)

@home.route("/postintroducepage",methods=["POST"])
def postintroducepage():
    uid = request.form["uid"]
    introduce = request.form["introduce"]
    user = User.query.filter_by(id=uid).first()
    user.introduce = introduce
    db.session.add(user)
    db.session.commit()
    return render_template("base/uintroduce.html",user=user)

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
    form.username.data = user.uname
    return render_template("base/unamechange.html",user=user,form=form)

@home.route("/getemailchangepage")
def getemailchangepage():
    form = InfoEditForm()
    uid = request.args["uid"]
    user = User.query.filter_by(id=uid).first()
    form.uemail.data = user.uemail
    return render_template("base/emailchange.html",user=user,form=form)

@home.route("/getphonechangepage")
def getphonechangepage():
    form = InfoEditForm()
    uid = request.args["uid"]
    user = User.query.filter_by(id=uid).first()
    form.uphone.data = user.uphone
    return render_template("base/phonechange.html",user=user,form=form)

@home.route("/getintroducechangepage")
def getintroducechangepage():
    form = InfoEditForm()
    uid = request.args["uid"]
    user = User.query.filter_by(id=uid).first()
    form.uintroduce.data = user.introduce
    return render_template("base/introducechange.html",user=user,form=form)

@home.route("/getusername")
def getusername():
    uid = request.args["uid"]
    user = User.query.filter_by(id = uid).first()
    user_name = user.uname
    return user_name

@home.route("/checkname")
def checkname():
    uname = request.args["user_name"]
    user_count = User.query.filter_by(uname=uname).count()
    return str(user_count)

@home.route("/checkemail")
def checkemail():
    user_email = request.args["user_email"]
    user_count = User.query.filter_by(uemail=user_email).count()
    return str(user_count)

@home.route("/postcover",methods=["POST"])
def postcover():
    uid = request.form["uid"]
    ucover = request.form["ucover"]
    ucover_type = request.form["ucover_type"]
    cover = base64.b64decode(ucover)
    file_cover = secure_filename(ucover)
    if not os.path.exists(FC_DIR):
        os.makedirs(FC_DIR)           
        os.chmod(FC_DIR,664)
    covername = change_filename(file_cover) + "."+ucover_type
    fileDIR = FC_DIR + covername
    try:
        file = open(fileDIR,"wb")
        file.write(cover)
        file.close()
        user = User.query.filter_by(id=uid).first()
        user.cover = covername
        db.session.add(user)
        db.session.commit()
    except:
        return "err"
    return "ok"

@home.route("/getusercover")
def getusercover():
    authorid = request.args["uid"]
    user = User.query.filter_by(id=authorid).first()
    cover = user.cover
    return cover

@home.route("/gettravelreviews")
def gettravelreviews():
    travel_id = request.args["uid"]
    page = request.args.get('page', 1, type=int)
    # page_data = Scenic.query.paginate(page=page, per_page=3)
    reviews = Review.query.filter(Review.travels_id==travel_id,Review.isactive==1).order_by(Review.addtime.desc()).all()
    return render_template("base/reviews.html",reviews=reviews)

@home.route("/userpostreviews",methods=["POST"])
def userpostreviews():
    uid = request.form["uid"]
    travel_id = request.form["travel_id"]
    review_content = request.form["review_content"]
    review = Review()
    review.travels_id = travel_id
    review.content = review_content
    review.user_id = uid
    db.session.add(review)
    db.session.commit()
    reviews = Review.query.filter(Review.travels_id==travel_id,Review.isactive==1).order_by(Review.addtime.desc()).all()
    return render_template("base/reviews.html",reviews=reviews)

@home.route("/delreviews",methods=["POST"])
def delreviews():
    review_id = request.form["review_id"]
    travel_id =request.form["travel_id"]
    review = Review.query.filter_by(id=review_id).first()
    review.isactive = False
    db.session.add(review)
    db.session.commit()
    reviews = Review.query.filter(Review.travels_id==travel_id,Review.isactive==1).order_by(Review.addtime.desc()).all()
    return render_template("base/reviews.html",reviews=reviews)


@home.route("/showscenic/<scenic_id>")
def showscenic(scenic_id):
    scenic = Scenic.query.filter_by(id=scenic_id).first()
    travels = Travels.query.filter(Travels.scenic_id==scenic_id,Travels.isactive==1).limit(5)
    return render_template("base/scenic_info.html",scenic=scenic,travels=travels)

@home.route("/writetravels",methods=["GET","POST"])
def writetravels():
    form = AddTravelsForm()
    form.scenic_id.choices = [(v.id, v.scenicname) for v in Scenic.query.all()]
    travels = Travels()
    form.submit.label.text = "发布"
    if form.validate_on_submit():
        data = form.data
        travel_count = Travels.query.filter_by(title=data["title"]).count()
        if travel_count == 1:
            flash("已存在同名游记,请使用别的标题","err")
            return render_template("base/writetravels.html",form = form)
        
        file_cover = secure_filename(form.cover.data.filename)
        if not os.path.exists(UP_DIR):
            os.makedirs(UP_DIR)           
            os.chmod(UP_DIR,664)
        cover = change_filename(file_cover) 
        form.cover.data.save(UP_DIR + cover)

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

@home.route("/traveledit/<travel_id>",methods=["GET","POST"])
def traveledit(travel_id):
    form = AddTravelsForm()
    form.submit.label.text = "修改"
    form.scenic_id.choices = [(v.id, v.scenicname) for v in Scenic.query.all()]
    form.cover.validators = []
    travel = Travels.query.filter_by(id=travel_id).first()
    if request.method == "GET":
        form.title.data = travel.title
        form.is_recommend.data = travel.is_recommend
        form.scenic_id.data = travel.scenic_id
        form.cover.data = travel.cover
        form.content.data = travel.content
    if form.validate_on_submit():
        data = form.data
        travels_count = Travels.query.filter_by(title=data["title"]).count()
        if travel.title != data["title"] and travels_count == 1:
            flash("游记已经存在","err")
            return render_template("base/traveledit.html",form=form)

        if not os.path.exists(UP_DIR):
            os.makedirs(UP_DIR)           
            os.chmod(UP_DIR,664)

        if form.cover.data != "":
            file_cover = secure_filename(form.cover.data.filename)     
            travel.cover = change_filename(file_cover)                       
            form.cover.data.save(UP_DIR + travel.cover)

        travel.title = data["title"]
        travel.is_recommend = data["is_recommend"]
        travel.scenic_id = data["scenic_id"]
        travel.content = data["content"]

        db.session.add(travel)
        db.session.commit()
        flash("修改游记成功","ok")
        return render_template("base/traveledit.html",form=form)
    return render_template("base/traveledit.html",form=form)


@home.route("/loadarea")
def loadarea():
    areas = Area.query.all()
    lst1 = []
    for area in areas:
        lst1.append(area.to_dic())
    return json.dumps(lst1)

@home.route("/loadscenic")
def loadscenic():
    area_id = request.args["area_id"]
    scenics = Scenic.query.filter_by(area_id=area_id).all()
    lst1 = []
    for scenic in scenics:
        lst1.append(scenic.to_dic())
    return json.dumps(lst1)

@home.route("/collecttravel",methods=["POST"])
def collecttravel():
    uid = request.form["uid"]
    travel_id = request.form["travel_id"]
    travelscollect = TravelsCollect()
    travelscollect.user_id = uid
    travelscollect.travels_id = travel_id
    db.session.add(travelscollect)
    db.session.commit()
    return "ok"

@home.route("/checktravelcollected")
def checktravelcollected():
    uid = request.args["uid"]
    travel_id = request.args["travel_id"]
    trvlcollect_count = TravelsCollect.query.filter(TravelsCollect.user_id==uid,TravelsCollect.travels_id==travel_id).count()
    return str(trvlcollect_count)

@home.route("/cancelcollecttravel",methods=["POST"])
def cancelcollecttravel():
    uid = request.form["uid"]
    travel_id = request.form["travel_id"]
    trvlcollect = TravelsCollect.query.filter(TravelsCollect.user_id==uid,TravelsCollect.travels_id==travel_id).first()
    db.session.delete(trvlcollect)
    db.session.commit()
    return "ok"

@home.route("/deletetravels/<travel_id>",methods=["GET","POST"])
def deletetravels(travel_id):
    url = request.headers.get("Referer","/")
    resp = redirect(url)
    travel = Travels.query.filter_by(id=travel_id).first()
    travel.isactive = False
    db.session.add(travel)
    db.session.commit()
    return resp

@home.route("/userinfo/review/<user_id>")
def userinfo_review(user_id):
    reviews = Review.query.filter(Review.user_id==user_id,Review.isactive==True).all()
    user = User.query.filter_by(id=user_id).first()
    return render_template("base/userinfo_review.html",user=user,reviews=reviews)

@home.route("/allscenics")
def allscenics():
    return render_template("base/allscenic.html")

@home.route("/alltravels")
def alltravels():
    return render_template("base/alltravels.html")



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

@home.route('/ckupload/', methods=['POST', 'OPTIONS'])
@user_login
def ckupload():
    """CKEditor 文件上传"""
    error = ''
    url = ''
    callback = request.args.get("CKEditorFuncNum")

    if request.method == 'POST' and 'upload' in request.files:
        fileobj = request.files['upload']
        fname, fext = os.path.splitext(fileobj.filename)
        rnd_name = '%s%s' % (gen_rnd_filename(), fext)

        filepath = os.path.join(current_app.static_folder, 'uploads/ckeditor', rnd_name)
        # 检查路径是否存在，不存在则创建
        dirname = os.path.dirname(filepath)
        if not os.path.exists(dirname):
            try:
                os.makedirs(dirname)
            except:
                error = 'ERROR_CREATE_DIR'
        elif not os.access(dirname, os.W_OK):
            error = 'ERROR_DIR_NOT_WRITEABLE'

        if not error:
            fileobj.save(filepath)
            url = url_for('static', filename='%s/%s' % ('uploads/ckeditor', rnd_name))
    else:
        error = 'post error'

    res = """<script type="text/javascript">
  window.parent.CKEDITOR.tools.callFunction(%s, '%s', '%s');
</script>""" % (callback, url, error)

    response = make_response(res)
    response.headers["Content-Type"] = "text/html"
    return response



