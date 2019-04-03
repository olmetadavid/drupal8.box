apache2:
  pkg:
    - installed
  service:
    - running
    - watch:
{% for project in pillar['projects'] %}
      - file: vhost-{{ project }}
{% endfor %}

php5-pkgs:
  pkg.installed:
    - names:
      - php5
      - php5-mysql
      - php5-curl
      - php5-cli
      - php5-cgi
      - php5-dev
      - php-pear
      - php5-gd
      - php5-xdebug
      - php5-sqlite
      - php5-json
      - php5-fpm
      - apache2-mpm-worker
      - libapache2-mod-fastcgi

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
