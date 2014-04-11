drupal8.box
===========

Provide an Drupal 8 friendly developpment environement.

Works with **VirtualBox** or **VMWare**

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

###Quickstart
In the "box" directory :

- For VirtualBox users : vagrant up
- For VMWare users : vagrant up --provider=vmware_fusion

Be careful: the bindfs plugin has been used for vmware fusion for performance reasons. If the "vagrant up" cause some problems, the rest of the process can be acheived with a "vagrant provision" command.
