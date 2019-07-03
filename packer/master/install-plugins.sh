#!/bin/bash
USER=$(cat /tmp/user.sensitive)
PWD=$(cat /tmp/pwd.sensitive)
for i in ssh-agent:latest ssh-credentials:latest ssh-slaves:latest
do
   /usr/lib/jvm/jre-1.8.0-openjdk/bin/java \
   -jar /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar \
   -s http://127.0.0.1:8080 \
   -auth $USER:$PWD \
   install-plugin $i
done