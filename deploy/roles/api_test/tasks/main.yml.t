---
- name: name
  uri:
    url: "{{'{{'}}public_host{{'}}'}}:{{'{{'}}{{deployConfig.instanceName}}_port{{'}}'}}/{{deployConfig.instanceName}}"
    body_format: json
    method: POST
    return_content: yes
    status_code: 201
    body: {
    }
  register: specialist_get

- debug: var=specialist_get.content
...
