drupal8.box
===========

Supply a virtual machine for Drupal 8 execution envionment.

## Informations

This box is based on :
- Saucy64 of the OS
- Virtualbox or VMWare
- Saltstack for the provisioning

This contains the following folders :
- box : the configuration files for the box
- dump : the dump files if needed
- logs : the logs files which Apache will generate
- scripts : some scripts if needed
- www : the web folder which must contains all Drupal 8 files

The box is intended to be configured with parameters included in the box/settings.yml, notably :
- IP: 10.20.30.60 => This IP address is used in the conf/salt/states/mysql/my.cnf file too (to mysql be attached to this address).

## Using this box

To configure:

You have to configure the box, updating the box/settings.yml first.
You can manage :
* The IP address
* The quantity of memory to give to the VM
* The number of processor to use
* The local box name to use (**be careful:** you have to use a saucy base box with this saltstack configuration)
* The URL of the base box to use (**be careful:** the actual base box is a VMWare base box. Change it if you use virtual box)
* The type of provider you use ("vb" for Virtual Box or "vmw" VM Ware)
* The shared folders

To use:

In the "box" directory : 
* For VirtualBox users : vagrant up
* For VMWare users : vagrant up --provider=vmware_fusion

Be careful: the bindfs plugin has been used for vmware fusion for performance reasons. If the "vagrant up" cause some problems, the rest of the process can be acheived with a "vagrant provision" command.

Note: for Virtual Box users, it could be required to give an IP address like this one : 10.0.0.100

## Example of base boxes

### For VMWare:

box_name: 'saucy64'
box_url: 'http://brennovich.s3.amazonaws.com/saucy64_vmware_fusion.box'

### For Virtual Box:

box_name: 'saucy64-vb'
box_url: 'http://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-i386-vagrant-disk1.box'
