# travel

#### 介绍
本项目是一个以flask框架进行开发的python web项目。这个网站分为前台和后台，前台主要包括旅游景点的介绍和游记分享功能，同时还有用户资料修改，用户书写游记等功能；后台主要包括地区，景区，游记的添加和修改，用户管理以及日志查看等功能。本项目比较适合python初学者。


#### 安装教程(Ubuntu)

1. 创建并进入虚拟环境(在项目目录下)，以避免环境冲突问题；

```python
pip3 install virtualenv;
virtualenv travelenv;
source travelenv/bin/activate
# 进入虚拟环境之后终端命令行前面会出现:  (travelenv)

```

2. requirements.txt文件是本项目的依赖包，在虚拟环境里使用以下命令进行安装：

```python
pip3 install -r requirements.txt
```

3. 创建MySql数据库travel，字符集为utf-8；

4. 进行数据库迁移(创建数据表)：

```python
python3 manage.py db init
python3 manage.py db migrate
python3 manage.py db upgrade
# 完成此步骤后travel数据库中会创建好本项目所有的数据表
```

5. 此时项目已经能够运行，但是由于数据库中还没有相应的数据，可以使用本项目提供的数据文件travel.sql

6. 启动服务器 python3 manage.py runserver ，之后即可使用浏览器127.0.0.1:5000进行访问；

7. 后台登陆账号密码均为admin