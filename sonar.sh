#!/bin/bash

  #This script is intended to install SonarQube
  #Author: Victor
  #Date: 06/19/2022

#Sonarqube doesnt  work when you start it  as root user

#if [ $UID == 0 ]; then
#	echo "You can't run this as a root user"
#	exit 2
#fi

su -${LOGNAME}

echo "Installing java 11 ...................."

sudo yum update -y

sudo yum install java-11-openjdk* -y

if [ $? != 0 ]; then
	echo "Java installation failed"
	exit 1
fi

echo "Downloading SonarQube latest versions................"

cd /opt

sudo yum install wget -y

if [ $? != 0 ]; then
        echo "wget installation failed"
        exit 1
fi

sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip 

echo "Extracting the packages..................."

sudo yum install unzip

sudo unzip /opt/sonarqube-9.3.0.51899.zip -A

sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899

echo "Starting sonarqube............................"

cd ./sonarqube-9.3.0.51899/bin/linux-x86-64

./sonar.sh start

./sonar.sh status

if [ $? != 0 ]; then
        echo "sonarqube setup failed"
        exit 1
fi

## Setting firewall to add and allow port :9000

sudo firewall-cmd --permanent --add-port=9000/tcp

sudo firewall-cmd --reload

echo "Please login in browser using the ip address below with port :9000"

ifconfig | grep inet

