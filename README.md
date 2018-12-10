# py_restful_microservice_template

## How to use
- For more information, please go to [codegen](https://github.com/cao5zy/codegen)
- All template files are ended with `.t`
- The structure of your template files will be the structure of your generated files
- Data is in `sample_data.json`
- The data should contains `project_name` which will be the folder name for the generated files
- Run `run.bat` to generate your files with templates and enjoy it.

## Process of developing the template
- install `md-codegen`
- run `codegen` command to tune your generation.

### Install md-codegen
Please make sure your current environment has already installed python3
```
pip install md-codegen
```
### Prepare your workspace
```
git clone <repo-for-templates>.git
cd py_restful_microservice_template
```
### Run
```
bash run.bat
```
After the running, please check the generated file at `py_restful_microservice_template/test/`

