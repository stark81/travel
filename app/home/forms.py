from flask_wtf import FlaskForm
from wtforms import StringField,BooleanField, PasswordField, SubmitField, FileField, TextAreaField, IntegerField
from wtforms.validators import DataRequired, Email, Regexp, EqualTo, ValidationError,Length
from app.models import User

class RegisterForm(FlaskForm):
    """
        定义'注册'表单，并定义表单字段的验证规则
    """
    username = StringField(
        label="用户名",
        validators=[
            DataRequired("用户名不能为空!"),
        ],
        render_kw={
            "placeholder":"请输入用户名"
        }      
    )
    uemail = StringField(
        label="邮箱",
        validators=[
            DataRequired("邮箱地址不能为空!"),
            Email("邮箱地址不正确"),
        ],
        render_kw={
            "placeholder":"请输入邮箱"
        }
    )
    upwd = PasswordField(
        label="密码",
        validators=[
            DataRequired("密码不能为空!"),
            Length(6,20,"密码长度在6~20位之间")
        ],
        render_kw={
            "placeholder":"请输入密码"
        }
    )
    repwd = PasswordField(
        label="确认密码",
        validators=[
            DataRequired("请输入确认密码!"),
            EqualTo("upwd","两次密码不一致!"),
        ],
        render_kw={"placeholder":"请输入确认密码"}
    )
    submit = SubmitField(
        "注册并登录",
        render_kw={
            "class": "btn btn-primary",
        }
    )
    # 自定义验证器的函数名,必须是validate_"", ""里的值必须是需要验证的字段
    # 这里是uemail,如果写成email则无法验证
    def validate_uemail(self,field):
        if User.query.filter_by(uemail=field.data).first():
            raise  ValidationError('该邮箱已被注册，请选用其它邮箱')
    def validate_username(self,field):
        if User.query.filter_by(uname=field.data).first():
            raise  ValidationError('用户名已被注册，请使用其他名称')


class LoginForm(FlaskForm):
    """
        定义'登陆'表单，并定义表单字段的验证规则
    """
    uemail = StringField(
        label="邮箱",
        validators=[
            DataRequired("邮箱不能为空!"),
            Email("邮箱地址不正确"),
        ],
        render_kw={
            "placeholder":"请输入邮箱"
        }
    )
    upwd = PasswordField(
        label="密码",
        validators=[
            DataRequired("密码不能为空!")
        ],
        render_kw={
            "type":"password",
            "placeholder":"请输入密码"
        }
    )

    saveupwd = BooleanField(
        label="记住密码",
        render_kw={
            "checked":"checked"
        }
    )

    submit = SubmitField(
        label="登陆",
        render_kw={
            "class": "btn btn-primary",
        }
    )
    
class InfoEditForm(FlaskForm):
    """
        定义'修改用户信息'表单，并定义表单字段的验证规则
    """
    username = StringField(
        label="用户名",
        validators=[
            DataRequired("用户名不能为空!")
        ],
        render_kw={
            # "class":"infoEditInput",
            "placeholder":"请输入用户名"
        }
    )
    uemail = StringField(
        label="电子邮箱",
        validators=[
            DataRequired("电子邮箱不能为空!"),
        ],
        render_kw={
            "placeholder":"请输入邮箱地址"
        }
    )
    uphone = IntegerField(
        label="手机号码",
    )
    uintroduce = TextAreaField(
        label="个人简介",
    )

class SuggestForm(FlaskForm):
    """
        定义'意见建议'表单，并定义表单字段的验证规则
    """
    uname = StringField(
        label="姓名：",
        validators=[
            DataRequired("姓名/昵称不能为空")
        ],
        render_kw={
            "placeholder":"请输入您的姓名/昵称"
        }
    )
    email = StringField(
        label="电子邮箱",
        validators=[
            DataRequired("电子邮箱不能为空"),
            Email("邮箱地址不正确")
        ],
        render_kw={
            "placeholder":"请输入邮箱地址"
        }
    )
    advice = TextAreaField(
        label="内容",
        validators=[
            DataRequired("建议意见不能为空")
        ],
        render_kw={
            "placeholder":"请输入您的建议"
        }
    )
    submit = SubmitField(
        label="提交",
        render_kw={
            "class":"btn btn-primary"
        }
    )