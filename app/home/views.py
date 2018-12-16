from . import home
from app import db
from app.models import User

@home.route("/")
def index(): 
    user = User()
    user.uname = "李四"
    user.upwd = "123456"
    user.uemail = "lisi@qq.com"
    user.uphone = "10987654321"
    db.session.add(user)
    db.session.commit()
    return "这里是首页!"