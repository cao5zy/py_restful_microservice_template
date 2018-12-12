[defaults]
port={{'{{'}}{{ deployConfig.instanceName }}_port {{ '}}'}}
{% for srv in dependedServers %}{{ srv.name }}={{'{{'}} {{ srv.name }} {{'}}'}}
{{ srv.name }}_port={{'{{'}} {{ srv.name }}_port {{'}}'}}{% endfor %}
