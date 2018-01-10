# Vagrant Configurations #
This repository stores all vagrant configurations useful to build VM (Virtualbox) exposing following services:
- Tomcat 8 web server
- Mysql 5.5 database
- Windows 7 operating sustem
- Jenkins server
- Ubuntu operating system

## Prerequisites ##

First of all, you need to install vagrant:
```
sudo apt-get install vagrant
```

Then you can install Virtualbox:

```
sudo apt-get install virtualbox
```

and install ansible
```
sudo apt-get install ansible
```

## Instructions ##
Go inside folder of the required service and launch following command-line to start it:
```
vagrant up
```
To stop it:
```
vagrant halt
```
To delete it (be careful):
```
vagrant destroy
```
