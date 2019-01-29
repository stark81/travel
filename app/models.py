from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime,date
from . import db
import json


# 用户表
class User(db.Model):
    __tablename__ = "user"
    __table_args__ = {"useexisting": True}
    id = db.Column(db.Integer,primary_key=True)
    uname = db.Column(db.String(100),unique=True)
    upwd = db.Column(db.String(100))
    cover = db.Column(db.String(255))
    introduce = db.Column(db.Text)
    uemail = db.Column(db.String(100),unique=True)
    uphone = db.Column(db.String(11),unique=True)
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)
    isActive = db.Column(db.Boolean,default=True)
    userlogs = db.relationship('Userlog', backref='user',lazy="dynamic")
    reviews = db.relationship("Review",backref="reviewers",lazy="dynamic")
    sceniccollects = db.relationship("ScenicCollect",backref="user",lazy="dynamic")
    travelscollects = db.relationship("TravelsCollect",backref="user",lazy="dynamic")
    travelarticle = db.relationship("Travels",backref="travelauthor",lazy="dynamic")

    def __init__(self,uname,uemail,upwd):
        '''uname,uemail,upwd'''
        self.uname = uname
        self.uemail = uemail
        self.upwd = upwd
    def __repr__(self):
        return "<User %r>" % self.uname


# 用户登陆日志表
class Userlog(db.Model):
    __tablename__ = "userlog"
    __table_args__ = {"useexisting": True}
    id = db.Column(db.Integer,primary_key=True)
    user_id = db.Column(db.Integer,db.ForeignKey("user.id"))
    ip = db.Column(db.String(100))
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)

    def __init__(self,user_id,ip):
        self.user_id = user_id
        self.ip = ip


# 地区表
class Area(db.Model):
    __tablename__ = "area"
    __table_args__ = {"useexisting": True}
    id = db.Column(db.Integer,primary_key=True)
    areaName = db.Column(db.String(100))
    is_recommend = db.Column(db.Boolean,default=None)
    introduce = db.Column(db.Text)
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)
    scenics = db.relationship("Scenic",backref="area",lazy="dynamic")
    def to_dic(self):
        dic = {
            "id":self.id,
            "areaName":self.areaName
        }
        return dic
        


# 意见建议表
class Suggest(db.Model):
    __tablename__ = "suggestion"
    __table_args__ = {"useexisting": True}
    id = db.Column(db.Integer,primary_key=True)
    uname = db.Column(db.String(100))
    uemail = db.Column(db.String(100))
    content = db.Column(db.Text)
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)


# 管理员表
class AdminList(db.Model):
    __tablename__ = "adminlist"
    __table_args__ = {"useexisting":True}
    id = db.Column(db.Integer,primary_key=True)
    uname = db.Column(db.String(100),unique=True)
    upwd = db.Column(db.String(100))
    adminlog = db.relationship("Adminlog",backref="adminlist",lazy="dynamic")
    operlog = db.relationship("Operlog",backref="adminlist",lazy="dynamic") 


# 管理员登陆日志表
class Adminlog(db.Model):
    __tablename__ = "adminlog"
    __table_args__ = {"useexisting":True}
    id = db.Column(db.Integer,primary_key=True)
    admin_id = db.Column(db.Integer,db.ForeignKey("adminlist.id"))
    ip = db.Column(db.String(100))
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)


# 管理员操作日志表
class Operlog(db.Model):
    __tablename__ = "operlog"
    __table_args__ = {"useexisting":True}
    id = db.Column(db.Integer,primary_key=True)
    admin_id = db.Column(db.Integer,db.ForeignKey("adminlist.id"))
    ip = db.Column(db.String(100))
    reason = db.Column(db.String(600))
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)


# 景区表
class Scenic(db.Model):
    __tablename__="scenic"
    __table_args__={"useexisting":True}
    id = db.Column(db.Integer,primary_key=True)
    scenicname = db.Column(db.String(255),unique=True)
    star = db.Column(db.Integer)
    cover = db.Column(db.String(255),unique=True)
    introduce = db.Column(db.Text)
    content = db.Column(db.Text)
    area_id = db.Column(db.Integer,db.ForeignKey("area.id"))
    address = db.Column(db.Text)
    is_recommend = db.Column(db.Boolean,default=False)
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)
    sceniccollects = db.relationship("ScenicCollect",backref="scenic",lazy="dynamic")
    travels = db.relationship("Travels",backref="scenic",lazy="dynamic")
    def to_dic(self):
        dic = {
            "id":self.id,
            "scenicname":self.scenicname
        }
        return dic


# 游记表
class Travels(db.Model):
    __tablename__ = "travels"
    __table_args__ = {"useexisting":True}
    id = db.Column(db.Integer,primary_key=True)
    title = db.Column(db.String(255),unique=True)
    author_id = db.Column(db.Integer,db.ForeignKey("user.id"))
    cover = db.Column(db.String(255),unique=True)
    scenic_id = db.Column(db.Integer,db.ForeignKey("scenic.id"))
    content = db.Column(db.Text)
    is_recommend = db.Column(db.Boolean,default=False)
    isactive = db.Column(db.Boolean,default=True)
    isdrafts = db.Column(db.Boolean,default=False)
    reviews = db.relationship("Review",backref="travels",lazy="dynamic")
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)
    travelscollects = db.relationship("TravelsCollect",backref="travels",lazy="dynamic")
    reviewers = db.relationship(
        "User",
        secondary = "review",
        lazy="dynamic",
        backref=db.backref("travels",lazy="dynamic")
    )

# 评论表
class Review(db.Model):
    __tablename__ = "review"
    __table_args__ = {"useexisting":True}
    id = db.Column(db.Integer,primary_key=True)
    travels_id = db.Column(db.Integer,db.ForeignKey("travels.id"))
    user_id = db.Column(db.Integer,db.ForeignKey("user.id"))
    content = db.Column(db.Text)
    isactive = db.Column(db.Boolean,default=True)
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)
    def to_dic(self):
        dic = {
            "id":self.id,
            "travels_id":self.travels_id,
            "user_id":self.user_id,
            "content":self.content,
            "isactive":self.isactive,
            "addtime":self.addtime.strftime('%Y-%m-%d %H:%M:%S'),
        }
        return dic

# 景区收藏表
class ScenicCollect(db.Model):
    __tablename__ = "sceniccollect"
    __table_args__ = {"useexisting":True}
    id = db.Column(db.Integer,primary_key=True)
    user_id = db.Column(db.Integer,db.ForeignKey("user.id"))
    scenic_id = db.Column(db.Integer,db.ForeignKey("scenic.id"))
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)


# 游记收藏表
class TravelsCollect(db.Model):
    __tablename__ = "travelscollect"
    __table_args__ = {"useexisting":True}
    id = db.Column(db.Integer,primary_key=True)
    user_id = db.Column(db.Integer,db.ForeignKey("user.id"))
    travels_id = db.Column(db.Integer,db.ForeignKey("travels.id"))
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)


# 关注表
class Friends(db.Model):
    __tablename__ = "friends"
    __table_args__ = {"useexisting":True}
    id = db.Column(db.Integer,primary_key=True)
    focused_id = db.Column(db.Integer)
    focuser_id = db.Column(db.Integer)
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)


# 留言表
class Message(db.Model):
    __tablename__ = "message"
    __table_args__ = {"useexisting":True}
    id = db.Column(db.Integer,primary_key=True)
    receiver_id = db.Column(db.Integer)
    content = db.Column(db.Text)
    send_id = db.Column(db.Integer)
    isalive = db.Column(db.Boolean,default=True)
    is_read = db.Column(db.Boolean,default=False)
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)