# -*- coding:utf-8 -*-
from . import home
from app import db
from app.models import User
from app.home.forms import RegisterForm
from flask import render_template,flash

@home.route("/")
def index(): 
    return render_template("base/index.html")

@home.route("/register/",methods=["GET","POST"])
def register():
    form = RegisterForm()
    if form.validate_on_submit():
        
        flash("注册成功","ok")
    return render_template("base/register.html",form = form)
    