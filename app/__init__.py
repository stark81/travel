from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask import Blueprint

app = Flask(__name__)
SECRET_KEY = 'mrsoft'
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://root:123456@127.0.0.1:3306/travel"
db = SQLAlchemy(app)

from app.home import home as home_blueprint
from app.admin import admin as admin_blueprint

app.register_blueprint(home_blueprint)
app.register_blueprint(admin_blueprint,url_prefix="/admin")