from flask_restful import Resource
from flask import request
from slogger import Logger
from pymongo import MongoClient
from config import Cfg

client = MongoClient("mongodb://{}:{}".format(Cfg.defaults['{{deployConfig.instanceName}}_db'], Cfg.defaults['{{deployConfig.instanceName}}_db_port']))

Db = client['{{deployConfig.instanceName}}']
