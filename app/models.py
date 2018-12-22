from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from . import db

class User(db.Model):
    __tablename__ = "user"
    __table_args__ = {"useexisting": True}
    id = db.Column(db.Integer,primary_key=True)
    uname = db.Column(db.String(100))
    upwd = db.Column(db.String(100))
    uemail = db.Column(db.String(100),unique=True)
    uphone = db.Column(db.String(11),unique=True)
    # uinfo = db.Column(db.text)
    uface = db.Column(db.String(255))
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)

    def __init__(self,uname,uemail,upwd):
        '''uname,uemail,upwd'''
        self.uname = uname
        self.uemail = uemail
        self.upwd = upwd

    

