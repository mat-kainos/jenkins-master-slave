
#!/bin/bash
JENKINS_URL=$(cat /home/centos/jenkins_url)
JAVA="/usr/lib/jvm/jre-1.8.0-openjdk/bin/java"
SWARM_CLIENT="/home/centos/swarm-client-3.17.jar"
JENKINS_USERNAME=$(cat /home/centos/user.sensitive)
JENKINS_PASSWORD=$(cat /home/centos/pwd.sensitive)

$JAVA -jar $SWARM_CLIENT -master $JENKINS_URL -username $JENKINS_USERNAME -password $JENKINS_PASSWORD