from flask import Flask
from slogger import Logger
from flask_restful import Api
from config import Cfg
{% for method in serviceInterface.methods %}from resources.{{method.name}} import {{ method.name | capitalize}} {% endfor %}

app = Flask(__name__)
api = Api(app)
logger = Logger.getLogger(__name__)

{% for method in serviceInterface.methods %}api.add_resource({{method.name | capitalize}}, "/{{method.name}}/<id>"){% endfor %}


if __name__ == "__main__":
    app.run(debug=True, port=Cfg.defaults["port"])

