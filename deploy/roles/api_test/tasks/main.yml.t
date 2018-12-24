---
{% for method in serviceInterface.methods %}
{% for http_method in method.http_methods %}
- name: test for {{method.name}}-{{http_method}}
  uri:
    url: "{{'{{'}}public_host{{'}}'}}:{{'{{'}}{{deployConfig.instanceName}}_port{{'}}'}}/{{method.name}}{% for key in method.params %}/<{{ key }}>{% endfor%}"
    body_format: json
    method: {{ http_method|upper }}
    return_content: yes
    status_code: 201
    body: {
    }
  register: {{method.name}}_{{http_method}}

- debug: var={{method.name}}_{{http_method}}.content
{% endfor %}
{% endfor %}
...
