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

class Suggest(db.Model):
    __tablename__ = "suggestion"
    __table_args__ = {"useexisting": True}
