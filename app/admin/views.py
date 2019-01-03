from . import admin
from app import db,UP_DIR
from app.models import *
from flask import render_template,flash,request,redirect,url_for,session,make_response,current_app
from werkzeug.security import generate_password_hash,check_password_hash
from functools import wraps
from app.admin.forms import AddAreaForm,LoginForm,AddScenicForm,AddTravelsForm
import os,uuid
from werkzeug.utils import secure_filename

def admin_login(f):
    """
    登录装饰器
    """

    @wraps(f)
    def decorated_function(*args, **kwargs):
        if "admin" not in session:
            return redirect(url_for("admin.login"))
        return f(*args, **kwargs)
    return decorated_function

@admin.route("/login",methods=["GET","POST"])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        # adminlist = AdminList()
        # adminlist.uname = form.data["uname"]
        # adminlist.upwd = generate_password_hash(form.data["upwd"])
        # db.session.add(adminlist)
        # db.session.commit()
        # return "注册成功"
        adminlist = db.session.query(AdminList).filter_by(uname=form.data["uname"]).first()
        if not adminlist:
            flash("账号不存在","err")
            return redirect(url_for("admin.login"))
        if check_password_hash(adminlist.upwd,form.data["upwd"]) is False:
            flash("密码错误","err")
            return redirect(url_for("admin.login"))
        adminlog = Adminlog()
        adminlog.admin_id = adminlist.id
        adminlog.ip = request.remote_addr
        db.session.add(adminlog)
        db.session.commit()
        session["admin"] = adminlist.id
        return redirect(url_for("admin.admin_index"))
    return render_template("admin/login.html",form=form)

@admin.route("/")
@admin_login
def index():
    return redirect(url_for("admin.admin_index"))

@admin.route("/index/firstpage")
@admin_login
def admin_index():
    return render_template("admin/index.html")

@admin.route("/user/userlist")
@admin_login
def user_list():
    page = request.args.get('page', 1, type=int)
    page_data = User.query.order_by(
            User.addtime.desc()
        ).paginate(page=page, per_page=6)
    return render_template("admin/list.html", page_data=page_data)

@admin.route("/log/userlog")
@admin_login
def userLog():
    page = request.args.get('page', 1, type=int)
    page_data = Userlog.query.order_by(
            Userlog.addtime.desc()
        ).paginate(page=page, per_page=6)
    return render_template("admin/userloginlog.html", page_data=page_data)

@admin.route("/area/addarea",methods=["GET","POST"])
@admin_login
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

            operlog = Operlog()
            operlog.admin_id = session["admin"]
            operlog.ip = request.remote_addr
            operlog.reason = "添加地区"+area.areaName
        
            db.session.add(area)
            db.session.add(operlog)
            db.session.commit()
            flash("添加成功","ok")
    return render_template("admin/addarea.html",form=form)

@admin.route("/area/arealist",methods=["GET","POST"])
@admin_login
def arealist():
    page = request.args.get('page', 1, type=int)
    page_data = Area.query.order_by(
            Area.addtime.desc()
        ).paginate(page=page, per_page=6)
    return render_template("admin/arealist.html",page_data=page_data)

@admin.route("/area/arealist/edit/<area_id>",methods=["GET","POST"])
@admin_login
def areaEdit(area_id=None):
    form = AddAreaForm()
    area = Area.query.get_or_404(area_id)
    areaNameOld = area.areaName
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

        operlog = Operlog()
        operlog.admin_id = session["admin"]
        operlog.ip = request.remote_addr
        operlog.reason = '修改地区"' + areaNameOld + '"为"' + area.areaName + '"'

        db.session.add(area)
        db.session.add(operlog)
        db.session.commit()
        flash("修改地区成功","ok")
        return redirect(url_for("admin.areaEdit",area_id=area.id))
    return render_template("admin/areachange.html",form=form)

@admin.route("/user/suggest")
@admin_login
def suggest():
    page = request.args.get('page', 1, type=int)
    page_data = Suggest.query.order_by(
            Suggest.addtime.desc()
        ).paginate(page=page, per_page=6)
    return render_template("admin/suggestion.html",page_data=page_data)

@admin.route("/scenic/sceniclist")
@admin_login
def sceniclist():
    page = request.args.get('page', 1, type=int)
    page_data = Scenic.query.order_by(
            Scenic.addtime.desc()
        ).paginate(page=page, per_page=6)
    return render_template("admin/sceniclist.html",page_data=page_data)

@admin.route("/log/adminlog")
@admin_login
def adminlog():
    page = request.args.get('page', 1, type=int)
    page_data = Adminlog.query.order_by(
            Adminlog.addtime.desc()
        ).paginate(page=page, per_page=6)
    return render_template("admin/adminlog.html",page_data=page_data)

@admin.route("/log/operlog")
@admin_login
def operlog():
    page = request.args.get('page', 1, type=int)
    page_data = Operlog.query.order_by(
            Operlog.addtime.desc()
        ).paginate(page=page, per_page=6)
    return render_template("admin/operlog.html",page_data=page_data)

@admin.route("/scenic/addscenic",methods=["GET","POST"])
@admin_login
def addscenic():
    form = AddScenicForm()
    form.area_id.choices = [(v.id, v.areaName) for v in Area.query.all()]
    if form.validate_on_submit():
        data = form.data
        scenic_count = db.session.query(Scenic).filter(Scenic.scenicname==data["scenicname"]).count()
        if scenic_count == 1:
            flash("景区已存在","err")
            return redirect(url_for("admin.addscenic"))

        file_cover = secure_filename(form.cover.data.filename)
        if not os.path.exists(UP_DIR):
            os.makedirs(UP_DIR)           
            os.chmod(UP_DIR,664)
        cover = change_filename(file_cover) 
        form.cover.data.save(UP_DIR + cover)
        
        scenic = Scenic()
        scenic.scenicname = data["scenicname"]
        scenic.cover = cover
        scenic.area_id = data["area_id"]
        scenic.address = data["address"]
        scenic.content = data["content"]
        scenic.introduce = data["introduce"]
        scenic.is_recommend = data["is_recommend"]
        scenic.star = data["star"]

        operlog = Operlog()
        operlog.admin_id = session["admin"]
        operlog.ip = request.remote_addr
        operlog.reason = "添加景区" + scenic.scenicname
        
        db.session.add(scenic)
        db.session.add(operlog)
        db.session.commit()

        flash("添加景区成功","ok") 
        return redirect(url_for("admin.addscenic"))
    return render_template("admin/addscenic.html",form=form)

@admin.route("/scenic/sceniclist/edit/<scenic_id>",methods=["GET","POST"])
def scenicedit(scenic_id=None):
    form = AddScenicForm()
    form.area_id.choices = [(v.id, v.areaName) for v in Area.query.all()] 
    form.cover.validators = []
    scenic = Scenic.query.get_or_404(scenic_id)
    scenicNameOld = scenic.scenicname

    if request.method == "GET":
        form.scenicname.data = scenic.scenicname
        form.star.data =scenic.star
        form.is_recommend.data = scenic.is_recommend
        form.introduce.data = scenic.introduce
        form.content.data = scenic.content
        form.area_id.data = scenic.area_id
        form.address.data = scenic.address
        form.cover.data = scenic.cover

    if form.validate_on_submit():
        data = form.data
        scenic_count = db.session.query(Scenic).filter(Scenic.scenicname==form.data["scenicname"]).count()
        if scenic.scenicname != form.data["scenicname"] and scenic_count == 1:
            flash("景区已存在","err")
            return redirect(url_for("admin.scenicedit",scenic_id=scenic.id))
        if not os.path.exists(UP_DIR):
            os.makedirs(UP_DIR)           
            os.chmod(UP_DIR,664)
        if form.cover.data != "":
            file_cover = secure_filename(form.cover.data.filename)     
            scenic.cover = change_filename(file_cover)                       
            form.cover.data.save(UP_DIR + scenic.cover)
        
        scenic.scenicname = data["scenicname"]
        scenic.star = data["star"]
        scenic.is_recommend = data["is_recommend"]
        scenic.area_id = data["area_id"]
        scenic.address = data["address"]
        scenic.introduce = data["introduce"]
        scenic.content = data["content"]

        operlog = Operlog()
        operlog.admin_id = session["admin"]
        operlog.ip = request.remote_addr
        operlog.reason = '修改景区"' +scenicNameOld + '"为"' + scenic.scenicname +'"'

        db.session.add(scenic)
        db.session.add(operlog)
        db.session.commit()

        flash("修改景区成功","ok")
        return redirect(url_for("admin.scenicedit",scenic_id=scenic.id))
    return render_template("admin/scenicchange.html",form=form)


@admin.route("/travels/travelslist")
def travelslist():
    page = request.args.get('page', 1, type=int)
    page_data = Travels.query.order_by(
            Travels.addtime.desc()
        ).paginate(page=page, per_page=6)
    return render_template("admin/travelslist.html",page_data=page_data)

@admin.route("/travels/addtravels",methods=["GET","POST"])
def addtravels():
    form = AddTravelsForm()
    form.scenic_id.choices = [(v.id, v.scenicname) for v in Scenic.query.all()]
    if form.validate_on_submit():
        data = form.data
        travels = Travels()
        operlog = Operlog()
        travel_count = Travels.query.filter_by(title=data["title"]).count()
        if travel_count == 1:
            flash("已存在同名游记,请使用别的标题","err")
            return render_template("admin/addtravels.html",form = form)

        file_cover = secure_filename(form.cover.data.filename)
        if not os.path.exists(UP_DIR):
            os.makedirs(UP_DIR)           
            os.chmod(UP_DIR,664)
        cover = change_filename(file_cover) 
        form.cover.data.save(UP_DIR + cover)   

        travels.title = data["title"]
        travels.author = data["author"]
        travels.scenic_id = data["scenic_id"]
        travels.cover = cover
        travels.content = data["content"]

        operlog.admin_id = session["admin"]
        operlog.ip = request.remote_addr
        operlog.reason = '添加游记"'+ travels.title +'"'

        db.session.add(travels)
        db.session.add(operlog)
        db.session.commit()

        flash("添加游记成功","ok")
        return render_template("admin/addtravels.html",form = form) 
    return render_template("admin/addtravels.html",form = form)




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

@admin.route('/ckupload/', methods=['POST', 'OPTIONS'])
@admin_login
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
