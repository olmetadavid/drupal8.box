php-pear:
  pkg.installed

libpcre3-dev:
  pkg.installed

build-essential:
  pkg.installed

php-apc:
  pkg.installed

/etc/php5/mods-available/apc.ini:
  file:
    - managed
    - source: salt://states/apc/apc.ini
    - require:
      - pkg: php-apc
