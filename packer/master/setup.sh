
#!/bin/bash
echo "Install Jenkins stable release"
yum remove -y java
yum install -y java-1.8.0-openjdk
yum install -y wget
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install -y jenkins
chkconfig jenkins on
echo "Install git"
yum install -y git
echo "Configure Jenkins"
mkdir -p /var/lib/jenkins/init.groovy.d
cp /tmp/security.groovy /var/lib/jenkins/init.groovy.d/security.groovy
service jenkins start
sleep 30
echo "Install plugins"
chmod +x /tmp/install-plugins.sh
/tmp/install-plugins.sh