
#!/bin/bash
JENKINS_URL="${jenkins_url}"
JENKINS_USERNAME="${jenkins_username}"
JENKINS_PASSWORD="${jenkins_password}"
touch /home/centos/log.log
/usr/lib/jvm/jre-1.8.0-openjdk/bin/java -jar /home/centos/swarm-client-3.17.jar -master $JENKINS_URL -username $JENKINS_USERNAME -password $JENKINS_PASSWORD >> /home/centos/log.log  2>&1
