# DISCLAIMER:
# This is not the provisioner we want, this is the provisioner we deserve

JAVA_VERSION="1.8.0"
TOMCAT_VERSION="8.0.36"
TOMCAT_USER="tomcat"

echo "Installing packages"
sudo yum -y install java-$JAVA_VERSION-openjdk-devel > /dev/null

echo "Downloading Tomcat"
cd /tmp && rm -rf apache-tomcat-$TOMCAT_VERSION.tar.gz \
  && wget http://www-eu.apache.org/dist/tomcat/tomcat-8/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz

echo "Unarchiving Tomcat into /opt"
cd /opt && sudo tar xvzf /tmp/apache-tomcat-$TOMCAT_VERSION.tar.gz

echo "Making a symlink in /opt/tomcat"
test -L /opt/tomcat || sudo ln -s /opt/apache-tomcat-$TOMCAT_VERSION /opt/tomcat

echo "Creating a unprivileged user for Tomcat execution"
# Giving Tomcat a valid shell could be useful for debugging purposes
id -u $TOMCAT_USER > /dev/null || sudo useradd $TOMCAT_USER -s /bin/bash -d /opt/tomcat
# This is rough, I know
sudo chown -R $TOMCAT_USER.$TOMCAT_USER /opt/apache-tomcat-$TOMCAT_VERSION

echo "Installing custom tomcat-users file"
sudo cp /vagrant/templates/tomcat-users.xml /opt/tomcat/conf/tomcat-users.xml

echo "Installing Systemd Tomcat service file and enabling the daemon"
sudo cp /vagrant/templates/tomcat.service /etc/systemd/system/tomcat.service
sudo systemctl daemon-reload
sudo systemctl start tomcat.service
sudo systemctl enable tomcat.service
