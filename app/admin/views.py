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

## =============后台登出功能=============== ##
@admin.route("/logout")
def logout():
    del session["admin"]
    del session["adminname"]
    return redirect(url_for("admin.login"))


## =============管理员后台登陆=============== ##
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

        # 账号密码验证通过，设置会话
        adminlog = Adminlog()
        adminlog.admin_id = adminlist.id
        adminlog.ip = request.remote_addr
        db.session.add(adminlog)
        db.session.commit()

        # 将登陆行为写入管理员登陆日志表
        session["adminname"] = adminlist.uname
        session["admin"] = adminlist.id
        return redirect(url_for("admin.admin_index"))
    return render_template("admin/login.html",form=form)

## =============后台首页=============== ##
@admin.route("/")
@admin_login
def index():
    return redirect(url_for("admin.admin_index"))

@admin.route("/index/firstpage")
@admin_login
def admin_index():
    return render_template("admin/index.html")

## =============查看用户列表=============== ##
@admin.route("/user/userlist")
@admin_login
def user_list():
    page = request.args.get('page', 1, type=int)  # 获取查看的页数
    page_data = User.query.order_by(
            User.addtime.desc()
        ).paginate(page=page, per_page=6)      
    return render_template("admin/list.html", page_data=page_data)

## =============查看用户日志=============== ##
@admin.route("/log/userlog")
@admin_login
def userLog():
    page = request.args.get('page', 1, type=int)
    page_data = Userlog.query.order_by(
            Userlog.addtime.desc()
        ).paginate(page=page, per_page=6)
    return render_template("admin/userloginlog.html", page_data=page_data)

## =============添加地区功能=============== ##
@admin.route("/area/addarea",methods=["GET","POST"])
@admin_login
def addarea():
    form = AddAreaForm()    
    if form.validate_on_submit():   # 如果添加地区表单的字段通过验证之后
        data = form.data            # 获取用户传递过来的表单数据
        area = db.session.query(Area).filter(Area.areaName==data["sname"]).count()
        if area:                    # 如果地区存在，返回提示信息
            flash("地区已存在","err")
            return redirect(url_for("admin.addarea"))
        else:                       
            area = Area()           # 如果地区不存在，则添加地区
            area.areaName = data["sname"]
            area.is_recommend = data["is_recommend"]
            area.introduce = data["introduce"]

            operlog = Operlog()     # 同时把管理员添加地区这一行为写入到操作日志表中
            operlog.admin_id = session["admin"]
            operlog.ip = request.remote_addr
            operlog.reason = "添加地区"+area.areaName
        
            db.session.add(area)
            db.session.add(operlog)
            db.session.commit()
            flash("添加成功","ok")
    return render_template("admin/addarea.html",form=form)

## =============查看地区列表=============== ##
@admin.route("/area/arealist",methods=["GET","POST"])
@admin_login
def arealist():
    page = request.args.get('page', 1, type=int)
    page_data = Area.query.order_by(
            Area.addtime.desc()
        ).paginate(page=page, per_page=6)
    return render_template("admin/arealist.html",page_data=page_data)

## =============编辑地区信息=============== ##
@admin.route("/area/arealist/edit/<area_id>",methods=["GET","POST"])
@admin_login
def areaEdit(area_id=None):
    form = AddAreaForm()
    area = Area.query.get_or_404(area_id)   # 根据地区id获取地区
    areaNameOld = area.areaName             # 记录旧的地区名
    if request.method == "GET":     # 如果请求方式为get，则把地区信息填写到表单中
        form.sname.data = area.areaName
        form.is_recommend.data = area.is_recommend
        form.introduce.data = area.introduce
    if form.validate_on_submit():   # 当表单验证通过并提交之后，将修改数据写入数据库
        data = form.data

        # 查询修改之后的地区名是否已经存在
        area_count = db.session.query(Area).filter(Area.areaName==data["sname"]).count()

        # 如果地区名称发生改变，并且改变之后的地区名已经存在，返回错误提示
        if area.areaName != data["sname"] and area_count == 1:
            flash("地区已存在","err")
            return redirect(url_for("admin.areaEdit",area_id=area.id))

        # 地区信息修改符合要求，写入数据库之中
        area.areaName = data["sname"]
        area.is_recommend = data["is_recommend"]
        area.introduce = data["introduce"]

        # 将修改地区操作写入管理员操作日志
        operlog = Operlog()
        operlog.admin_id = session["admin"]
        operlog.ip = request.remote_addr
        if areaNameOld == area.areaName:
            operlog.reason = '修改地区"' + area.areaName + '"'
        else:
            operlog.reason = '修改地区"' + areaNameOld + '"为"' + area.areaName + '"'

        db.session.add(area)
        db.session.add(operlog)
        db.session.commit()
        flash("修改地区成功","ok")
        return redirect(url_for("admin.areaEdit",area_id=area.id))
    return render_template("admin/areachange.html",form=form)

## =============查看意见建议功能=============== ##
@admin.route("/user/suggest")
@admin_login
def suggest():
    page = request.args.get('page', 1, type=int)
    page_data = Suggest.query.order_by(
            Suggest.addtime.desc()
        ).paginate(page=page, per_page=6)
    return render_template("admin/suggestion.html",page_data=page_data)

## =============查看景区列表功能=============== ##
@admin.route("/scenic/sceniclist")
@admin_login
def sceniclist():
    page = request.args.get('page', 1, type=int)
    page_data = Scenic.query.order_by(
            Scenic.addtime.desc()
        ).paginate(page=page, per_page=6)
    return render_template("admin/sceniclist.html",page_data=page_data)

## =============查看管理员登陆日志=============== ##
@admin.route("/log/adminlog")
@admin_login
def adminlog():
    page = request.args.get('page', 1, type=int)
    page_data = Adminlog.query.order_by(
            Adminlog.addtime.desc()
        ).paginate(page=page, per_page=6)
    return render_template("admin/adminlog.html",page_data=page_data)

## =============查看管理员操作日志=============== ##
@admin.route("/log/operlog")
@admin_login
def operlog():
    page = request.args.get('page', 1, type=int)
    page_data = Operlog.query.order_by(
            Operlog.addtime.desc()
        ).paginate(page=page, per_page=6)
    return render_template("admin/operlog.html",page_data=page_data)

## =============增加景区功能=============== ##
@admin.route("/scenic/addscenic",methods=["GET","POST"])
@admin_login
def addscenic():
    form = AddScenicForm()

    # 获取地区id和地区名，用于景区与地区绑定
    form.area_id.choices = [(v.id, v.areaName) for v in Area.query.all()]
    if form.validate_on_submit():
        data = form.data    

        # 查看景区是否已存在于数据库之中
        scenic_count = db.session.query(Scenic).filter(Scenic.scenicname==data["scenicname"]).count()
        if scenic_count == 1:
            flash("景区已存在","err")
            return redirect(url_for("admin.addscenic"))
        
        file_cover = secure_filename(form.cover.data.filename)  
        if not os.path.exists(UP_DIR):      # UP_DIR为封面图片保存地址，如果地址不存在则创建
            os.makedirs(UP_DIR)           
            os.chmod(UP_DIR,664)
        cover = change_filename(file_cover)     # 修改图片名称，避免重名
        form.cover.data.save(UP_DIR + cover)    # 保存图片
        
        # 将景区数据写入数据库
        scenic = Scenic()
        scenic.scenicname = data["scenicname"]
        scenic.cover = cover
        scenic.area_id = data["area_id"]
        scenic.address = data["address"]
        scenic.content = data["content"]
        scenic.introduce = data["introduce"]
        scenic.is_recommend = data["is_recommend"]
        scenic.star = data["star"]

        # 将添加景区写入管理员操作日志表
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

## =============修改景区信息=============== ##
@admin.route("/scenic/sceniclist/edit/<scenic_id>",methods=["GET","POST"])
@admin_login
def scenicedit(scenic_id=None):
    form = AddScenicForm()              # 修改景区功能使用的是添加景区的表单
    form.submit.label.text = "修改"     # 将提交的按钮改为修改 
    form.area_id.choices = [(v.id, v.areaName) for v in Area.query.all()] 
    form.cover.validators = []          # 将原有的封面图片的验证规则修改为空
    scenic = Scenic.query.get_or_404(scenic_id)
    scenicNameOld = scenic.scenicname

    if request.method == "GET":         # 如果请求方式为空，把景区信息写入表单之中
        form.scenicname.data = scenic.scenicname
        form.star.data =scenic.star
        form.is_recommend.data = scenic.is_recommend
        form.introduce.data = scenic.introduce
        form.content.data = scenic.content
        form.area_id.data = scenic.area_id
        form.address.data = scenic.address
        form.cover.data = scenic.cover

    if form.validate_on_submit():       # 一旦进行修改，并提交之后
        data = form.data                # 获取修改后的表单数据

        # 查看修改后的景区是否已经存在
        scenic_count = db.session.query(Scenic).filter(Scenic.scenicname==form.data["scenicname"]).count()
        if scenic.scenicname != form.data["scenicname"] and scenic_count == 1:
            flash("景区已存在","err")
            return redirect(url_for("admin.scenicedit",scenic_id=scenic.id))
        if not os.path.exists(UP_DIR):
            os.makedirs(UP_DIR)           
            os.chmod(UP_DIR,664)

        # 如果封面图片数据不为空，说明修改了景区的封面图片，将其写入数据库
        if form.cover.data != "":
            file_cover = secure_filename(form.cover.data.filename)     
            scenic.cover = change_filename(file_cover)                       
            form.cover.data.save(UP_DIR + scenic.cover)
        
        # 将修改后的信息提交到数据库中
        scenic.scenicname = data["scenicname"]
        scenic.star = data["star"]
        scenic.is_recommend = data["is_recommend"]
        scenic.area_id = data["area_id"]
        scenic.address = data["address"]
        scenic.introduce = data["introduce"]
        scenic.content = data["content"]

        # 将修改景区写入管理员操作日志
        operlog = Operlog()
        operlog.admin_id = session["admin"]
        operlog.ip = request.remote_addr
        if scenicNameOld == scenic.scenicname:
            operlog.reason = '修改景区"' + scenic.scenicname + '"'
        else:
            operlog.reason = '修改景区"' +scenicNameOld + '"为"' + scenic.scenicname +'"'

        db.session.add(scenic)
        db.session.add(operlog)
        db.session.commit()

        flash("修改景区成功","ok")
        return redirect(url_for("admin.scenicedit",scenic_id=scenic.id))
    return render_template("admin/scenicchange.html",form=form)

## =============查看所有游记=============== ##
@admin.route("/travels/travelslist")
@admin_login
def travelslist():
    adminName = session["adminname"]
    page = request.args.get('page', 1, type=int)
    page_data = Travels.query.order_by(
            Travels.addtime.desc()
        ).paginate(page=page, per_page=6)
    return render_template("admin/travelslist.html",page_data=page_data,adminName=adminName)

## =============删除游记=============== ##
@admin.route("/travels/dele/<travels_id>")
@admin_login
def travels_dele(travels_id):
    # 根据游记id获取游记，并将其‘isactive’字段设置为0表示删除
    travels = Travels.query.filter_by(id=travels_id).first()
    travels.isactive = 0

    operlog = Operlog()     # 将删除日志写入管理员操作日志中
    operlog.admin_id = session["admin"]
    operlog.ip = request.remote_addr
    operlog.reason = '删除游记"' + travels.title + '"'
    
    db.session.add(travels)
    db.session.add(operlog)
    db.session.commit()
    return redirect(url_for("admin.travelslist"))


## =============恢复游记=============== ##
@admin.route("/travels/recover/<travels_id>")
@admin_login
def travels_recover(travels_id):
    travels = Travels.query.filter_by(id=travels_id).first()
    travels.isactive = 1

    operlog = Operlog()
    operlog.admin_id = session["admin"]
    operlog.ip = request.remote_addr
    operlog.reason = '恢复游记"' + travels.title + '"'

    db.session.add(travels)
    db.session.add(operlog)
    db.session.commit()
    return redirect(url_for("admin.travelslist"))

## =============添加游记功能=============== ##
@admin.route("/travels/addtravels",methods=["GET","POST"])
@admin_login
def addtravels():
    form = AddTravelsForm()

    # 获取景区id和景区名，用于游记和景区的绑定
    form.scenic_id.choices = [(v.id, v.scenicname) for v in Scenic.query.all()]

    if form.validate_on_submit():
        data = form.data
        operlog = Operlog()
        travel_count = Travels.query.filter_by(title=data["title"]).count()
        travels = Travels()
        if travel_count == 1:
            flash("已存在同名游记,请使用别的标题","err")
            return render_template("admin/addtravels.html",form = form)

        # 获取游记封面并保存
        file_cover = secure_filename(form.cover.data.filename)
        if not os.path.exists(UP_DIR):
            os.makedirs(UP_DIR)           
            os.chmod(UP_DIR,664)
        cover = change_filename(file_cover) 
        form.cover.data.save(UP_DIR + cover)   

        # 保存游记到数据库
        travels.title = data["title"]
        travels.scenic_id = data["scenic_id"]
        travels.is_recommend = data["is_recommend"]
        travels.cover = cover
        travels.content = data["content"]

        # 将添加游记写入管理员操作日志
        operlog.admin_id = session["admin"]
        operlog.ip = request.remote_addr
        operlog.reason = '添加游记"'+ travels.title +'"'

        db.session.add(travels)
        db.session.add(operlog)
        db.session.commit()

        flash("添加游记成功","ok")
        return render_template("admin/addtravels.html",form = form) 
    return render_template("admin/addtravels.html",form = form)


## =============修改游记功能=============== ##
@admin.route("/travels/travelslist/edit/<travels_id>",methods=["GET","POST"])
@admin_login
def travels_edit(travels_id):
    form = AddTravelsForm()         # 使用的是添加游记表单
    form.submit.label.text = "修改" # 将表单的提交按钮改为修改
    form.scenic_id.choices = [(v.id, v.scenicname) for v in Scenic.query.all()]
    form.cover.validators = []      # 将游记封面图的验证规则改为空
    travels = Travels.query.get_or_404(travels_id)
    travels_old = travels.title

    if request.method == "GET":     # 如果请求方式为空，将游记信息填入表单中
        form.title.data = travels.title
        form.is_recommend.data = travels.is_recommend
        form.scenic_id.data = travels.scenic_id
        form.cover.data = travels.cover
        form.content.data = travels.content

    if form.validate_on_submit():   # 表单通过验证，并提交到后台
        data = form.data            # 获取表单信息
        travels_count = Travels.query.filter_by(title=data["title"]).count()

        if travels.title != data["title"] and travels_count == 1:
            flash("游记已经存在","err")
            return render_template("admin/travelsedit.html",form=form)

        # 查看图片保存地址是否存在，如果不存在则创建
        if not os.path.exists(UP_DIR):
            os.makedirs(UP_DIR)           
            os.chmod(UP_DIR,664)

        # 如果游记封面图片不为空，修改图片名称并保存
        if form.cover.data != "":
            file_cover = secure_filename(form.cover.data.filename)     
            travels.cover = change_filename(file_cover)                       
            form.cover.data.save(UP_DIR + travels.cover)

        # 将修改后的游记信息写入数据库
        travels.title = data["title"]
        travels.is_recommend = data["is_recommend"]
        travels.scenic_id = data["scenic_id"]
        travels.content = data["content"]

        # 将修改游记写入管理员操作日志
        operlog = Operlog()
        operlog.admin_id = session["admin"]
        operlog.ip = request.remote_addr
        if travels_old == travels.title:
            operlog.reason = '修改游记"' + travels.title +'"'
        else:
            operlog.reason = '修改游记"' + travels_old + '"为"' + travels.title + '"'

        db.session.add(travels)
        db.session.add(operlog)
        db.session.commit()

        flash("修改游记成功","ok")
        return render_template("admin/travelsedit.html",form = form) 
    return render_template("admin/travelsedit.html",form=form)

## =============查看游记评论功能=============== ##
@admin.route("/travels/reviews")
@admin_login
def reviews():
    page = request.args.get('page', 1, type=int)
    page_data = Review.query.order_by(
            Review.addtime.desc()
        ).paginate(page=page, per_page=6)
    return render_template("admin/review.html",page_data=page_data)

## =============删除评论功能=============== ##
@admin.route("/travels/review/dele/<review_id>")
@admin_login
def review_dele(review_id):
    # 根据评论id获取评论数据并将状态改为删除
    review = Review.query.filter_by(id=review_id).first()
    review.isactive = 0

    # 将删除评论写入到管理员操作日志中
    operlog = Operlog()
    operlog.admin_id = session["admin"]
    operlog.ip = request.remote_addr
    operlog.reason = '删除' + review.travels.reviewers.first().uname + '在游记"' + review.travels.title +'"中的评论'
    
    db.session.add(review)
    db.session.add(operlog)
    db.session.commit()
    return redirect(url_for("admin.reviews"))

## =============恢复评论功能=============== ##
@admin.route("/travels/review/recover/<review_id>")
@admin_login
def review_recover(review_id):
    # 根据评论id获取评论数据并将状态改为正常
    review = Review.query.filter_by(id=review_id).first()
    review.isactive = 1

    # 将恢复评论写入到管理员操作日志中
    operlog = Operlog()
    operlog.admin_id = session["admin"]
    operlog.ip = request.remote_addr
    operlog.reason = '恢复' + review.travels.reviewers.first().uname + '在游记"' + review.travels.title +'"中的评论'
    
    db.session.add(review)
    db.session.add(operlog)
    db.session.commit()
    return redirect(url_for("admin.reviews"))


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
