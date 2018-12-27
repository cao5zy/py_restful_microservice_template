from flask import Flask
from slogger import Logger
from flask_restful import Api
from config import Cfg
from resources import {% for method in serviceInterface.methods %}{{ method.name | capitalize}}{% if not loop.last %},{% endif %} {% endfor %}

app = Flask(__name__)
api = Api(app)
logger = Logger.getLogger(__name__)

{% for method in serviceInterface.methods %}api.add_resource({{method.name | capitalize}}, "/{{method.name}}{% for key in method.params %}/<{{ key }}>{% endfor%}"){% endfor %}


if __name__ == "__main__":
    app.run(debug=True, port=Cfg.defaults["port"], host="0.0.0.0")

