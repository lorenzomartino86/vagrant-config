#!/bin/bash

########################
# Jenkins
########################
echo "Installing Jenkins"
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get -y install jenkins
echo "Installed Jenkins"

########################
# JDK 8
########################
echo "Installing JDK 8"
sudo apt-get install -y openjdk-8-jdk
echo "JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64" >> ~/.bash_profile
echo "export JAVA_HOME" >> ~/.bash_profile
echo "PATH=$JAVA_HOME/bin:$PATH" >> ~/.bash_profile
echo "export PATH" >> ~/.bash_profile
source ~/.bash_profile
echo "Installed JDK 8"

########################
# MAVEN 3
########################
echo "Installing Maven 3"
sudo apt-get install -y maven
echo "Installed Maven 3"

sudo service jenkins restart
echo "Success"