from flask_restful import Resource
from flask import request
from slogger import Logger
from pymongo import MongoClient
from config import Cfg

{% for srv in dependedServers if srv.type == 'db' %}client_{{ srv.name }} = MongoClient('mongodb://{}:{}'.format(Cfg.dbs['{{srv.name}}'], Cfg.dbs['{{srv.name}}_port']))
Db_{{srv.name|capitalize}} = client_{{ srv.name }}['{{srv.name}}']
{% endfor %}
