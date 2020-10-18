#!/bin/bash

echo "Welcome ... Creating a cluster environment"
echo ""

if [ ! -f ssh-key ]; then
echo "$(date)"
echo "Creating an ssh-key pair:"
echo "Private key (It should be used to ssh VMs): ssh-key"
echo "Public key (It is automatically transferred to VMs): ssh-key.pub"
ssh-keygen -b 2048 -t rsa -f ./ssh-key -q -N ""
else
echo "$(date)"
echo "An ssh-key already exists ... skipping the ssh-key creation"
fi

echo "Copying the Vagrantfile to ./vagrant"
cp Vagrantfile ./vagrant/
echo "Copying the ssh-key to ./vagrant"
cp ssh-key ./vagrant/

NETWORK=$(cat Vagrantfile | grep "vm_net_ip[[:space:]]="  | sed 's/vm_net_ip[[:space:]]=[[:space:]]//g'  | sed 's/"//g')
START_IP="10"
MASTER_NODE_IP=$(echo $NETWORK | sed 's/\r//g')$START_IP
NUMBER_OF_NODES=$(cat Vagrantfile | grep "N[[:space:]]="  | sed 's/N[[:space:]]=[[:space:]]//g' | sed 's/"//g' | sed 's/\r//g')

echo ""
echo "$(date)"
echo "Creating Nodes..."
echo "Number of Master Nodes: " 1
echo "Number of Worker Nodes: " $NUMBER_OF_NODES
echo ""
echo "$(date)"
echo "Validating the Vagrant installation..."
vagrant version

if [ ! $? == 0 ]; then
echo ""
echo "$(date)"
echo "The Vagrant is not properly installed."
echo "Exiting..."
exit -1
fi


if [ ! -f Vagrantfile ]; then
echo ""
echo "$(date)"
echo "The Vagrantfile does not exist in the working directory"
echo "Exiting..."
exit -1
fi

echo ""
echo "$(date)"
echo "Building a new cluster environment..."
vagrant up

if [ ! $? == 0 ]; then
echo ""
echo "$(date)"
echo "ERROR creating the environment."
echo "Exiting"
vagrant destroy -f
exit -1
else
echo ""
echo "$(date)"
echo "The environment was successfully created"
fi

echo ""
echo "$(date)"
echo "Removing ssh-key and Vagrantfile from /vagrant"
rm -fr ./vagrant/ssh-key ./vagrant/Vagrantfile ./vagrant/Vagrantfile
echo ""
echo "Enjoy, your cluster environment is ready!"
