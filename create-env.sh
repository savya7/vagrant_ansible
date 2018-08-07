#!/bin/bash
### Written by Shrinidhi
### Use this script to create Vagrant local env with one Controller Node and two Test Node to test Ansible Playbooks in local envirnoment
### Pre-Req Vagrant should be installed

usage() {
  echo -e "USAGE:"
  echo $0 "[OPTIONS]"
  echo "OPTIONS:"
  echo -e "O\t\t OS type centos|ubuntu or any other"
  echo -e "V\t\t Version of the OS to be used"
  echo -e "N\t\t Number of node machines needed"
  echo "All Options are mandatory"
}

if [ $# -eq 0 ];
then
  echo "Insufficient arguments passed.Please see the usage below"
  usage;
  exit 1;
fi

while getopts ":O:V:N:" opt; do
  case $opt in
    O) os="$OPTARG"
    ;;
    V) version="$OPTARG"
    ;;
    N) nodes="$OPTARG"
    ;;
    *) echo "Invalid option -$OPTARG" >&2
       echo "Refer usage";
       usage;
    ;;
  esac
done

if [[ -f Vagrantfile ]];
then
  echo "Deleting existing Vagrantfile and envirnoment"
  vagrant destroy -f
  rm -rf Vagrantfile
fi

cp template Vagrantfile
sed -i "s/{{OS}}/$os/g" Vagrantfile
sed -i "s/{{VERSION}}/$version/g" Vagrantfile
sed -i "s/{{NODES}}/$nodes/g" Vagrantfile

vagrant up

if [ $? -ne 0 ];
then
  echo "Envirnoment is not up do vagrant status and see what machines are up and run the script after fixing the issue"
  exit 1;
else
  echo "Everything went fine!!"
  echo "################# DO FOLLOWING ACTIONS IN ORDER #####################"
  echo "1) Do vagrant ssh ansible"
  echo "2) Copy ansible.cfg and inventory.ini files from /vagrant dir to home folder"
fi
