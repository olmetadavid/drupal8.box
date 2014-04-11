drupal8.box
===========

Supply a virtual machine for Drupal 8 execution envionment.

This box is based on :
- Saucy64 of the OS
- Virtualbox or VMWare
- Salt for the provisioning

This contains the following folders :
- box : the configuration files for the box
- dump : the dump files if needed
- logs : the logs files which Apache will generate
- scripts : some scripts if needed
- www : the web folder which must contains all Drupal 8 files

The box is intended to be configured with parameters included in the box/settings.yml, notably :
- IP: 10.20.30.60 => This IP address is used in the conf/salt/states/mysql/my.cnf file too (to mysql be attached to this address).

To use :
- In the "box" directory : 
- - For VirtualBox users : vagrant up
- - For VMWare users : vagrant up --provider=vmware_fusion

Be careful: the bindfs plugin has been used for vmware fusion for performance reasons. If the "vagrant up" cause some problems, the rest of the process can be acheived with a "vagrant provision" command.
