# coding=utf-8
from db_declare import db

__author__ = 'airead'

#1	id	int	4	0	是	是	否
#2	name	nvarchar	80	0			否		组名称


class GroupModel(db.Model):
    __tablename__ = 'groups'

    id = db.Column(db.Integer, primary_key=True, nullable=False, autoincrement=True)
    #: 组名称
    name = db.Column(db.String(80), unique=True, nullable=False)
    #: 标识
    tag = db.Column(db.String(40), unique=True, nullable=True)

    users = db.relationship('UserGroupModel', backref='group')
    permission = db.relationship('GroupPermissionModel', backref='group')

    def __repr__(self):
        return '<Group %r>' % self.id