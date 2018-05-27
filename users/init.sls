{% from "users/map.jinja" import users with context %}

{%- for name, user in pillar.get('users', {}).items()
{{ name }}:
  user.present:
    - fullname: {{ name }}
    - home: /home/{{ name }}
    - shell:{{ user.get('shell', current.get('shell', users.get('shell', '/bin/bash'))) }}
    {% if 'uid' in user -%}
    - uid: {{ user['uid'] }}
    {% endif %}
    {% if 'gid' in user -%}
    - gid: {{ user['gid'] }}
    {% endif %}
    - groups:
      - {{ user_group }}
      {% for group in user.get('groups', []) -%}
      - {{ group }}
      {% endfor %}



{% if 'sudouser' in user %}
/etc/sudoers.d/{{ name }}:
  file.managed:
  - source: salt://users/templates/sudoers.d.jinja2
  - template: jinja
  - context:
    user_name: {{ name }}
{% endif 

 users_absent_user_{{ name }}:
   user.absent:
      - name: {{ name }}
