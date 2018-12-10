---
- name: "build the src for {{ deployConfig.instanceName }}"
  file:
    path: "{{'{{'}} deploy_root {{'}}'}}"
    state: directory

- name: "copy files from src to deploy folder"
  synchronize:
    src: "./src/"
    dest: "{{'{{'}} deploy_root {{'}}'}}"

- name: "build the image for "{{'{{'}} deploy_root {{'}}'}}""
  docker_image:
    name: "{{ '{{' }} {{ deployConfig.instanceName}} {{ '}}' }}_img"
    tag: latest
    path: "{{ '{{' }} deploy_root {{ '}}' }}/docker_image"
    
    
- name: "deploy {{ '{{' }} {{ deployConfig.instanceName }} {{ '}}' }} for dev"
  docker_container:
    name: " {{ '{{' }} {{ deployConfig.instanceName }} {{ '}}' }}"
    image: " {{ '{{' }} {{ deployConfig.instanceName }} {{ '}}' }}_img:latest"
    working_dir: "/app"
    volumes:
      - " {{ '{{' }} {{ deploy_root }} {{ '}}' }}:/app:Z"
    ports:
      - "{{ '{{' }} {{ deployConfig.instanceName }}_port {{ '}}' }}: {{ '{{' }} {{ deployConfig.instanceName }}_port {{ '}}' }}"
    state: started
    restart: yes
    entrypoint: python app.py
  when: specialist_service_debug == "true"

- pause:
    seconds: 5
...
