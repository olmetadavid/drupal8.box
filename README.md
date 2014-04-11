drupal8.box
===========

Provide an Drupal 8 friendly developpment environement.

Works with **VirtualBox** or **VMWare**

Based on Ubuntu 13.10 *"Saucy Salamander"*

##Structure:

- box : the configuration files for the box
- dump : the dump files if needed
- logs : the logs files which Apache will generate
- scripts : some scripts if needed
- www : the web folder which must contains all Drupal 8 files

##Configuration
The box is intended to be configured with parameters included in the box/settings.yml, notably :

- IP: 10.20.30.60 => This IP address is used in the conf/salt/states/mysql/my.cnf file too (to mysql be attached to this address).

##Installation

Depending on wich provider you use (VMWare or VirtualBox) choose the corrsponding settings file in box/ and rename it settings.yml.

You can also edit you own settings.yml if you wish to use your own base box.

###VMWare
Place youself in the box forlder

>vagrant up --provider=vmware_fusion

###Virtualbox
Place youself in the box forlder

> vagrant up
