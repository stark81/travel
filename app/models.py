from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from . import db

class User(db.Model):
    __tablename__ = "user"
    __table_args__ = {"useexisting": True}
    id = db.Column(db.Integer,primary_key=True)
    uname = db.Column(db.String(100),unique=True)
    upwd = db.Column(db.String(100))
    uemail = db.Column(db.String(100),unique=True)
    uphone = db.Column(db.String(11),unique=True)
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)
    isActive = db.Column(db.Boolean,default=True)
    userlogs = db.relationship('Userlog', backref='user')
    reviews = db.relationship("Review",backref="user")
    sceniccollects = db.relationship("ScenicCollect",backref="user")
    travelscollects = db.relationship("TravelsCollect",backref="user")

    def __init__(self,uname,uemail,upwd):
        '''uname,uemail,upwd'''
        self.uname = uname
        self.uemail = uemail
        self.upwd = upwd
    def __repr__(self):
        return "<User %r>" % self.uname
    
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

class Area(db.Model):
    __tablename__ = "area"
    __table_args__ = {"useexisting": True}
    id = db.Column(db.Integer,primary_key=True)
    areaName = db.Column(db.String(100))
    is_recommend = db.Column(db.Boolean,default=None)
    introduce = db.Column(db.Text)
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)
    scenics = db.relationship("Scenic",backref="area")

class Suggest(db.Model):
    __tablename__ = "suggestion"
    __table_args__ = {"useexisting": True}
    id = db.Column(db.Integer,primary_key=True)
    uname = db.Column(db.String(100))
    uemail = db.Column(db.String(100))
    content = db.Column(db.Text)
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)
    
class AdminList(db.Model):
    __tablename__ = "adminlist"
    __table_args__ = {"useexisting":True}
    id = db.Column(db.Integer,primary_key=True)
    uname = db.Column(db.String(100),unique=True)
    upwd = db.Column(db.String(100))
    adminlog = db.relationship("Adminlog",backref="adminlist")
    operlog = db.relationship("Operlog",backref="adminlist") 

class Adminlog(db.Model):
    __tablename__ = "adminlog"
    __table_args__ = {"useexisting":True}
    id = db.Column(db.Integer,primary_key=True)
    admin_id = db.Column(db.Integer,db.ForeignKey("adminlist.id"))
    ip = db.Column(db.String(100))
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)

class Operlog(db.Model):
    __tablename__ = "operlog"
    __table_args__ = {"useexisting":True}
    id = db.Column(db.Integer,primary_key=True)
    admin_id = db.Column(db.Integer,db.ForeignKey("adminlist.id"))
    ip = db.Column(db.String(100))
    reason = db.Column(db.String(600))
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)

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
    sceniccollects = db.relationship("ScenicCollect",backref="scenic")
    travels = db.relationship("Travels",backref="scenic")

class Travels(db.Model):
    __tablename__ = "travels"
    __table_args__ = {"useexisting":True}
    id = db.Column(db.Integer,primary_key=True)
    title = db.Column(db.String(255),unique=True)
    author = db.Column(db.String(255))
    cover = db.Column(db.String(255),unique=True)
    scenic_id = db.Column(db.Integer,db.ForeignKey("scenic.id"))
    content = db.Column(db.Text)
    reviews = db.relationship("Review",backref="travels")
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)
    travelscollects = db.relationship("TravelsCollect",backref="travels")

class Review(db.Model):
    __tablename__ = "review"
    __table_args__ = {"useexisting":True}
    id = db.Column(db.Integer,primary_key=True)
    travels_id = db.Column(db.Integer,db.ForeignKey("travels.id"))
    user_id = db.Column(db.Integer,db.ForeignKey("user.id"))
    content = db.Column(db.Text)
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)

class ScenicCollect(db.Model):
    __tablename__ = "sceniccollect"
    __table_args__ = {"useexisting":True}
    id = db.Column(db.Integer,primary_key=True)
    user_id = db.Column(db.Integer,db.ForeignKey("user.id"))
    scenic_id = db.Column(db.Integer,db.ForeignKey("scenic.id"))
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)

class TravelsCollect(db.Model):
    __tablename__ = "travelscollect"
    __table_args__ = {"useexisting":True}
    id = db.Column(db.Integer,primary_key=True)
    user_id = db.Column(db.Integer,db.ForeignKey("user.id"))
    travels_id = db.Column(db.Integer,db.ForeignKey("travels.id"))
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)