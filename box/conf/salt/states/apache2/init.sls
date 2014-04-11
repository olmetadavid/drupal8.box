apache2:
  pkg:
    - installed
  service:
    - running
    - watch:
{% for project in pillar['projects'] %}
      - file: vhost-{{ project }}
{% endfor %}

apache2-mpm-worker:
  pkg.installed

libapache2-mod-fastcgi:
  pkg.installed

php5-fpm:
  pkg.installed

php5:
  pkg.installed

php5-cgi:
  pkg.installed

php5-cli:
  pkg.installed

php5-curl:
  pkg.installed

php5-dev:
  pkg.installed

php5-gd:
  pkg.installed

php5-mysql:
  pkg.installed

php5-xdebug:
  pkg.installed

php5-json:
  pkg.installed

/etc/php5/fpm/pool.d/www.conf:
  file:
    - managed
    - source: salt://states/apache2/fpm.conf
    - require:
      - pkg: apache2
      - pkg: php5-fpm

/etc/php5/fpm/php.ini:
  file:
    - managed
    - source: salt://states/apache2/php.ini
    - require:
      - pkg: apache2
      - pkg: php5-fpm

apache-active-modules:
  cmd.run:
    - name: a2enmod actions fastcgi alias rewrite proxy_fcgi
    - require:
      - pkg: apache2
      - pkg: libapache2-mod-fastcgi

{% for project in pillar['projects'] %}

vhost-{{ project }}:
  file:
    - managed
    - source: salt://states/apache2/vhost_template
    - name: /etc/apache2/sites-available/{{ pillar['projects'][project]['domain'] }}.conf
    - user: root
    - group: root
    - template: jinja
    - mode: 644
    - defaults:
       server_name: {{ pillar['projects'][project]['domain'] }}
       doc_root: {{ pillar['projects'][project]['doc_root'] }}
       logs_dir: {{ pillar['projects'][project]['logs_dir'] }}
    - require:
      - pkg: apache2

vhost-{{ project }}-active:
  cmd.run:
    - name: a2ensite {{ pillar['projects'][project]['domain'] }}.conf
    - require:
      - file: vhost-{{ project }}

{% endfor %}
