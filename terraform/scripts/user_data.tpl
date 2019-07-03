
#!/bin/bash
JENKINS_URL="${jenkins_url}"
JENKINS_USERNAME="${jenkins_username}"
JENKINS_PASSWORD="${jenkins_password}"
/usr/lib/jvm/jre-1.8.0-openjdk/bin/java -jar /swarm-client-3.17.jar -master $JENKINS_URL -username $JENKINS_USERNAME -password $JENKINS_PASSWORD
