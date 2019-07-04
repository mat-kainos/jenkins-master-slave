
#!/bin/bash
echo "Install Jenkins stable release"
yum remove -y java
yum install -y java-1.8.0-openjdk
yum install -y wget awk
wget http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
awk '{sub(/1/,"0")}1' jenkins.repo > /etc/yum.repos.d/jenkins.repo
#curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
#rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install -y jenkins
chkconfig jenkins on
echo "Configure Jenkins"
mkdir -p /var/lib/jenkins/init.groovy.d
cp /home/centos/security.groovy /var/lib/jenkins/init.groovy.d/security.groovy
service jenkins start
sleep 30
echo "Install plugins"
chmod +x /home/centos/install-plugins.sh
#/home/centos/install-plugins.sh