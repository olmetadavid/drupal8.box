drupal8.box (VirtualBox)
========================

Provide an Drupal 8 friendly developpment environement.

Based on Ubuntu 13.10 *"Saucy Salamander"*

###Structure:

- box : the configuration files for the box
- dump : the dump files if needed
- logs : the logs files which Apache will generate
- scripts : some scripts if needed
- www : the web folder which must contains all Drupal 8 files

###Configuration
The box is intended to be configured with parameters included in the box/settings.yml, notably :

- IP: 10.20.30.60 => This IP address is used in the conf/salt/states/mysql/my.cnf file too (to mysql be attached to this address).

####Virtualbox installation

- In box/sttings.yml change your *box_url* to a Unbuntu 13.10 box compatible with Virtualbox
- Change *vm_provider* to "virtualbox"
