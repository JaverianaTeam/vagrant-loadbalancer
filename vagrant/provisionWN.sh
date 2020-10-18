#!/bin/bash


echo $(date)
echo "Installing Java"
yum install -y java-1.8.0-openjdk
java -jar /tmp/balanceo-0.0.1-SNAPSHOT.jar
