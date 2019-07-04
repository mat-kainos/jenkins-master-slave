
#!/bin/bash
JENKINS_URL=$(cat /tmp/jenkins_url)
JAVA="/usr/lib/jvm/jre-1.8.0-openjdk/bin/java"
SWARM_CLIENT="/tmp/swarm-client-3.17.jar"
JENKINS_USERNAME=$(cat /tmp/user.sensitive)
JENKINS_PASSWORD=$(cat /tmp/pwd.sensitive)

$JAVA -jar $SWARM_CLIENT -master $JENKINS_URL -username $JENKINS_USERNAME -password $JENKINS_PASSWORD