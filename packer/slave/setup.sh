#!/bin/bash
echo "Install Java JDK 8"
yum remove -y java
yum install -y java-1.8.0-openjdk
yum install -y wget
echo "Install git"
yum install -y git

