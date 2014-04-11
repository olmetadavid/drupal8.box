composer:
  cmd.run:
    - name: curl -sS https://getcomposer.org/installer | php
    - require:
      - pkg: php5-cli
      - pkg: curl
      - pkg: php5-json

composer-global:
  cmd.run:
    - name: mv composer.phar /usr/local/bin/composer
    - require:
      - cmd: composer

composer-install:
  cmd.run:
    - name: sed -i '1i export PATH="/home/vagrant/.composer/vendor/bin:$PATH"' /home/vagrant/.bashrc
    - require:
      - cmd: composer-global

drush-install:
  cmd.run:
    - name: composer global require drush/drush:dev-master
    - user: vagrant
    - group: vagrant
    - require:
      - cmd: composer-install

/home/vagrant/.composer/vendor/drush/drush/php.ini:
  file:
    - managed
    - source: salt://states/drush/drush-php.ini
    - require:
      - cmd: drush-install