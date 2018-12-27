[defaults]
port={{'{{'}}{{ deployConfig.instanceName }}_port {{ '}}'}}
{% for srv in dependedServers if srv.type != 'db' %}{{ srv.name }}={{'{{'}} {{ srv.name }} {{'}}'}}
{{ srv.name }}_port={{'{{'}} {{ srv.name }}_port {{'}}'}}{% endfor %}

[dbs]
{% for srv in dependedServers if srv.type == 'db' %}{{ srv.name }}={{'{{'}} {{ srv.name }} {{'}}'}}
{{ srv.name }}_port={{'{{'}} {{ srv.name }}_port {{'}}'}}{% endfor %}
