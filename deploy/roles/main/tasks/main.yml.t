---
- name: "build the src for {{specialist_service_root}}"
  file:
    path: "{{specialist_service_root}}"
    state: directory

- name: "copy files from src to deploy folder"
  synchronize:
    src: "./src/"
    dest: "{{specialist_service_root}}/"

- name: "build the image for {{specialist_service}}"
  docker_image:
    name: "{{specialist_service}}_img"
    tag: latest
    path: "{{specialist_service_root}}/docker_image"
    
    
- name: "deploy {{specialist_service}} for dev"
  docker_container:
    name: "{{specialist_service}}"
    image: "{{specialist_service}}_img:latest"
    working_dir: "/app"
    volumes:
      - "{{specialist_service_root}}:/app:Z"
    ports:
      - "{{specialist_service_port}}:{{specialist_service_port}}"
    state: started
    restart: yes
    entrypoint: python app.py
  when: specialist_service_debug == "true"

- pause:
    seconds: 5
...
