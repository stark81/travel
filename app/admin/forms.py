from flask_wtf import FlaskForm
from wtforms import StringField,RadioField,TextAreaField,SubmitField
from wtforms.validators import DataRequired

class AddAreaForm(FlaskForm):
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