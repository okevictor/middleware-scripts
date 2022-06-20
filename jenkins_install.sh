#!/bin/bash

   #This script is intended to install all Jenkins package
   #Author: Victor
   #Date: 06/18/2022



#function pkg_Install(){
#       echo $echo_msg
#       $task
#       if [ $? != 0 ]; then
#               echo $error_msg
#               exit 1
#       else
#               echo "Process successful!!!"
#       fi
#}

echo "Installing java .............."

sudo yum install java-1.8.0-openjdk-devel -y

if [ $? != 0 ]; then
        echo "Java installation failed"
        exit 1
else
        echo "Process successful!!!"
fi

echo "Installing wget .............."

sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo

if [ $? != 0 ]; then
        sudo yum install wget -y
        if [ $? != 0 ]; then
                echo "wget installation failed"
                exit 1
        fi
fi

echo "Disabling gpgcheck .............."

sudo sed -i "s/gpgcheck=1/gpgcheck=0/g" /etc/yum.repos.d/jenkins.repo

if [ $? != 0 ]; then
        echo "Disabling gpgcheckh failed"
        exit 1
else
        echo "Process successful!!!"
fi


echo "Installing Jenkins .............."

sudo yum install jenkins -y

if [ $? != 0 ]; then
        echo "Jenkins installation failed"
        exit 1
else
        echo "Process successful!!!"
fi


echo "Starting Jenkins .............."

sudo systemctl start jenkins

if [ $? != 0 ]; then
        echo "Jenkins does not start"
        exit 1
else
        echo "Process successful!!!"
fi


echo "checking Jenkins status ........................"

sudo systemctl status jenkins | grep -q running

if [ $? != 0 ]; then
        echo "jenkins deamo is not running"
        exit 1
else
        echo "Process successful!!!"
fi


echo "Enabling jenkings ..........................."

sudo systemctl enable jenkins

if [ $? != 0 ]; then
        echo "jenkins is not enabled"
        exit 1
else
        echo "Process successful!!!"
fi

echo ".................."
echo ".................."
echo "Jenkins installed successfully"
