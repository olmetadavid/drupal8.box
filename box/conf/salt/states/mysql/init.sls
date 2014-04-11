mysql-server:
  pkg.installed

python-mysqldb:
  pkg.installed

/etc/mysql/my.cnf:
  file:
    - managed
    - source: salt://states/mysql/my.cnf

mysql-service:
  service.running:
    - name: mysql
    - watch:
      - file: /etc/mysql/my.cnf
    - require:
      - pkg: mysql-server
      - pkg: python-mysqldb

{% for project in pillar['projects'] %}

{% if pillar['projects'][project]['database'] is defined %}

mysql-{{ project }}:
  mysql_database.present:
    - name: {{ pillar['projects'][project]['database'] }}
    - require:
      - service: mysql
  mysql_user.present:
    - name: {{ pillar['projects'][project]['user']['login'] }}
    - password: {{ pillar['projects'][project]['user']['password'] }}
    - host: '{{ pillar['projects'][project]['user']['host'] }}'
    - require:
      - mysql_database.present: {{ project }}
  mysql_grants.present:
    - database: {{ pillar['projects'][project]['database'] }}.*
    - host: '{{ pillar['projects'][project]['user']['host'] }}'
    - grant: ALL PRIVILEGES
    - user: {{ pillar['projects'][project]['user']['login'] }}
    - revoke_first: true
    - require:
      - mysql_user.present: {{ pillar['projects'][project]['user']['login'] }}

{% endif %}

{% endfor %}