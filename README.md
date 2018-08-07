# vagrant_Ansible
Written By : Savya

Use this to create a local vagrant envirnoment to test Ansible Playbooks. 

Run the create-env.sh script like this 

USAGE: ./create-env.sh [OPTIONS]

OPTIONS:

  O   OS type centos|ubuntu or any other
  
  V   Version of the OS to be used
  
  N   Number of node machines needed

EG:

./create-env.sh -Ocentos -V7 -N2
 
Configuration:

Ansible Node: Which is your Controller Node where Ansible is installed and from which you will run playbooks

Node[1....]: Nodes which will be used for testing.
