from flask_wtf import FlaskForm
from flask_wtf.file import FileAllowed
from wtforms import StringField,RadioField,TextAreaField,SubmitField,PasswordField,SelectField,FileField,HiddenField
from wtforms.validators import DataRequired

class AddAreaForm(FlaskForm):
<<<<<<< HEAD
    """
        定义'添加地区'表单，并定义表单字段的验证规则
    """
=======
>>>>>>> 18ae3fb1fff265da96c95730e7328defca54afd0
    sname = StringField(
        label="名称",
        validators=[
            DataRequired("省区名称不能为空!")
        ],
        render_kw={
            "placeholder":"请输入省区名称"
        }
    )

    is_recommend = RadioField(
        label="是否推荐",
        coerce = int,
        choices=[ (1,'是'),(0, '否')], default=0, 
    )

    introduce = TextAreaField(
        label="地区简介",
        validators=[
            DataRequired("简介不能为空!")
        ]
    )
    add = SubmitField(
        label="添加", 
    )
    change = SubmitField(
        label="修改"
    )

class LoginForm(FlaskForm):
<<<<<<< HEAD
    """
        定义'登陆'表单，并定义表单字段的验证规则
    """
=======
>>>>>>> 18ae3fb1fff265da96c95730e7328defca54afd0
    uname = StringField(
        label="账号",
        validators=[
            DataRequired("账号不能为空!")
        ],
        render_kw={
            "placeholder":"请输入账号"
        }
    )
    upwd = PasswordField(
        label="密码",
        validators=[
            DataRequired("密码不能为空!")
        ],
        render_kw={
            "placeholder":"请输入密码"
        }
    )
    submit = SubmitField(
        label="登陆"
    )

class AddScenicForm(FlaskForm):
<<<<<<< HEAD
    """
        定义'添加景区'表单，并定义表单字段的验证规则
    """
=======
>>>>>>> 18ae3fb1fff265da96c95730e7328defca54afd0
    scenicname = StringField(
        label="景区名",
        validators=[
            DataRequired("景区名不能为空!")
        ],
        render_kw={
            "placeholder":"请输入景区名"
        }
    )

    area_id = SelectField(
        label="所属地区",
        validators=[
            DataRequired("请选择所属地区!")
        ],
        coerce = int,
    )

    address = StringField(
        label="景区地址",
        validators=[
            DataRequired("景区地址不能为空!")
        ],
        render_kw={
            "placeholder":"请输入景区地址"
        }
    )

    cover = FileField(
        label="景区封面",
        validators=[
            DataRequired("封面图片不能为空!"),
            FileAllowed(["png","jpg"],"仅支持png和jpg格式的文件")
        ]
    )

    is_recommend = RadioField(
        label="是否推荐",
        coerce = int,
        choices=[ (1,'是'),(0, '否')], default=0, 
    )

    star = SelectField(
        label="星级",
        validators=[
            DataRequired("请选择景区星级!")
        ],
        coerce=int,
        choices=[(1,"1星"),(2,"2星"),(3,"3星"),(4,"4星"),(5,"5星")],default=5
    )

    introduce = TextAreaField(
        label="景区简介",
        validators=[
            DataRequired("景区简介不能为空!")
        ],
        render_kw={
            "class": "form-control",
            "rows": 5
        }
    )

    content = TextAreaField(
        label="景区内容",
        validators=[
            DataRequired("景区内容不能为空！")
        ],
        render_kw={
            "class": "form-control ckeditor",
            "rows": 10
        }
    )

    submit = SubmitField(
        label="添加",
    )



class AddTravelsForm(FlaskForm):
<<<<<<< HEAD
    """
        定义'添加游记'表单，并定义表单字段的验证规则
    """
=======
>>>>>>> 18ae3fb1fff265da96c95730e7328defca54afd0
    title = StringField(
        label="标题",
        validators=[
            DataRequired("标题不能为空!")
        ],
        render_kw={
            "placeholder":"请输入标题"
        }
    )

    cover = FileField(
        label="游记封面",
        validators=[
            DataRequired("封面图片不能为空!"),
            FileAllowed(["png","jpg"],"仅支持png和jpg格式的文件")
        ]
    )

    is_recommend = RadioField(
        label="是否推荐",
        coerce = int,
        choices=[ (1,'是'),(0, '否')], default=0, 
    )


    scenic_id = SelectField(
        label="所属景区",
        coerce=int,
    )

    content = TextAreaField(
        label="游记内容",
        validators=[
            DataRequired("景区内容不能为空！")
        ],
        render_kw={
            "class": "form-control ckeditor",
            "rows": 10
        }
    )


    submit = SubmitField(
        label="添加",
    )