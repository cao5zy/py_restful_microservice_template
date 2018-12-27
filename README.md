# py_restful_microservice_template

This is a project of templates for microservice with RESTful Api. The templates are driven by [codegen](https://github.com/cao5zy/codegen).

Following the 3 steps below to use it for your first time.
1. Install codegen
2. Prepare your data for the template
3. Generate your microservice project

## Install codegen
```
/usr/bin/python3 -m pip install md-codegen
```
codegen is developed in python 3. Please make sure it is install in python 3 envirnonment to run correctly.

## Prepare your data for the template
It would be the best choice to copy the code from [sample_data.json](./sample_data.json) to create your data for the template
```
{
    "deployConfig": {
	    "instanceName": "<your_microservice_name>"
    },
    serviceInterface: {
	"methods": [
	    {
		"name": "<method_name>",
		"http_methods": ["get"],
		"params": {
		    "id": "string",
		    "name": "string"
		    }
	    }
	]
    },
    dependedServers: [
	{
	    "name": "<other_service_name>",
	    "type": "db"
	}
    ]
}
```
- `your_microservice_name`: this name will be applied to the folder of the microservice project, the name of container, etc.
- `method_name`: this name will be applied to the restful resource definition.
- `other_service_name`: this name will be applied to the db properties.

## Generate your microservice project
```
codegen --output=./workspace --template-repo=git@github.com:cao5zy/py_restful_microservice_template.git --template-tag=v1.0.0 --datafile=template_data.json
```
It will generate a folder with the `your_microservice_name` under the workspace.





Try it and have fun. Please make a issue if you have problems, comments and requirements on it.


## Example project
Please take the following example for your first run.   
template_data.json
```
{
    "deployConfig": {
	    "instanceName": "customers_service"
    },
    serviceInterface: {
	"methods": [
	    {
		"name": "customers",
		"http_methods": ["get"],
		"params": {
		    "name": "string",
		    "age": "int"
		    }
	    }
	]
    },
    dependedServers: [
	{
	    "name": "customer_service_db",
	    "type": "db"
	}
    ]
}

```

Assuming that you will store the output code in `./workspace`. Run it with the following command.
```
codegen --output=./workspace --template-repo=git@github.com:cao5zy/py_restful_microservice_template.git --template-tag=v1.0.0 --datafile=./template_data.json
```
Then you will get the following structure.
```
workspace
     └── customers_service
         ├── deploy
         │   ├── dev.cfg
         │   └── roles
         │       ├── api_test
         │       │   └── tasks
         │       │       └── main.yml
         │       └── main
         │           ├── defaults
         │           │   └── main.yml
         │           ├── tasks
         │           │   └── main.yml
         │           ├── templates
         │           │   └── app.cfg.template
         │           └── vars
         │               └── main.yml
         └── src
             ├── app.py
             ├── config.py
             ├── db.py
             ├── docker_image
             │   ├── Dockerfile
             │   └── requirements.txt
             └── slogger.cfg

```
