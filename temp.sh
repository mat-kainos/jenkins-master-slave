#!/bin/bash
JENKINS_URL="http://99.0.10.82:8080"
JENKINS_USERNAME="test"
JENKINS_PASSWORD="test"
TOKEN=$(curl -u $JENKINS_USERNAME:$JENKINS_PASSWORD ''$JENKINS_URL'/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
INSTANCE_NAME=$(curl -s 169.254.169.254/latest/meta-data/local-hostname)
INSTANCE_IP=$(curl -s 169.254.169.254/latest/meta-data/local-ipv4)
JENKINS_CREDENTIALS_ID="creds-test"
sleep 60
curl -v -u $JENKINS_USERNAME:$JENKINS_PASSWORD -H "$TOKEN" -d 'script=
import hudson.model.Node.Mode
import hudson.slaves.*
import jenkins.model.Jenkins
import hudson.plugins.sshslaves.SSHLauncher
  Slave slave = new DumbSlave(
                    "agent-node","Agent node description",
                    "/home/jenkins",
                    "1",
                    Node.Mode.NORMAL,
                    "agent-node-label",
                    new SSHLauncher("agenNode",22,"user","password","","","","",""),
                    new RetentionStrategy.Always(),
                    new LinkedList())
  slave.getNodeProperties().add(envPro)
  Jenkins.instance.addNode(slave)
  ' $JENKINS_URL/script