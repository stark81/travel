<<<<<<< HEAD
# travel

#### 介绍
{**以下是码云平台说明，您可以替换此简介**
码云是开源中国推出的基于 Git 的代码托管平台（同时支持 SVN）。专为开发者提供稳定、高效、安全的云端软件开发协作平台
无论是个人、团队、或是企业，都能够用码云实现代码托管、项目管理、协作开发。企业项目请看 [https://gitee.com/enterprises](https://gitee.com/enterprises)}

#### 软件架构
软件架构说明


#### 安装教程

1. xxxx
2. xxxx
3. xxxx

#### 使用说明

1. xxxx
2. xxxx
3. xxxx

#### 参与贡献

1. Fork 本仓库
2. 新建 Feat_xxx 分支
3. 提交代码
4. 新建 Pull Request


#### 码云特技

1. 使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2. 码云官方博客 [blog.gitee.com](https://blog.gitee.com)
3. 你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解码云上的优秀开源项目
4. [GVP](https://gitee.com/gvp) 全称是码云最有价值开源项目，是码云综合评定出的优秀开源项目
5. 码云官方提供的使用手册 [https://gitee.com/help](https://gitee.com/help)
6. 码云封面人物是一档用来展示码云会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)
=======
# 悦游网站开发

#### 介绍
当前，年轻人日益增长的旅游需求和相对缺乏的旅游资讯之间的矛盾已经成为了阻碍旅游业健康稳健发展的一个问题。如何有效地减轻这一矛盾已经成为旅游行业的当务之急。传统的旅游网站一般以机票购买，门票购买等为主营业务，用户难以获取景区游玩攻略心得，难以获取其他用户对该景区的评论等，而景区方面也无法及时获取游客的建议意见，从而导致景区整改落后于市场需求。在这一背景之下，公司受悦游科技有限公司委托，启动了基于Python – Flask框架的“悦游”网站项目开发工作。网站以社交为导向，主打景区介绍和用户旅游攻略，游记分享，打造一个以分享促交流，以交流促进步的旅游平台。



#### 网站功能

网站前台功能：1. 景点和游记搜索、查看功能； 2. 用户发表以及修改游记功能；3. 用户搜索、查看，添加好友等功能；5. 用户个人中心功能，包括查看用户发表的游记攻略、评论、景区收藏、好友关注、留言等功能；6. 用户资料修改功能等；

网站后台功能：1. 用户管理功能，包括用户列表以及用户的建议意见；2. 地区、景区功能，包括地区、景区列表，相关资料的查看，修改，删除等功能；3. 游记管理功能，包括官方游记的修改、删除、恢复，用户游记的删除、恢复功能；4. 日志管理功能，包括用户登录日志，管理员登陆日志，管理员操作日志等。

#### 环境、框架

python 3.6 + Flask

开发环境： Ubuntu

数据库： MySQl

#### 使用说明

1. 搭建虚拟环境venv，并自行安装依赖，所有依赖在项目根目录的 requirement.txt 中；

```python
pip3 install virtualenv
virtualenv venv
source venv/Script/activate
pip3 install -r requiremt.txt
```

2. 创建mysql数据库，命名为travel，字符集为utf8，然后进行数据库迁移。如有需要，可以使用本项目提供的测试数据库数据travel.sql;

```python
python3 manage.py db init
python3 manage.py migrate
python3 manage.py upgrade
```

3. 启动项目；

```python
python3 manage.py runserver
```


#### 部分代码

![验证邮箱存在性](https://images.gitee.com/uploads/images/2019/0306/093329_48e8b4b7_2325526.png "travel1.png")

![用户修改头像](https://images.gitee.com/uploads/images/2019/0306/093406_e8e687f1_2325526.png "travel2.png")

#### 项目运行部分截图

![首页](https://images.gitee.com/uploads/images/2019/0306/093929_3b5fdeb7_2325526.png "运行2.png.png")

![个人中心](https://images.gitee.com/uploads/images/2019/0306/093950_aca82063_2325526.png "运行1.png.png")

>>>>>>> 18ae3fb1fff265da96c95730e7328defca54afd0
