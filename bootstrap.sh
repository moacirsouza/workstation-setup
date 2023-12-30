#!/bin/bash

###
# Makes the regular user into a superuser that
# does not need to type any passwords to become
# root from now on
###
configure_sudoers(){
    
    file=/etc/sudoers.d/${USER}

    echo "$USER ALL=(ALL) NOPASSWD:ALL" | \
    sudo tee $file

}

###
# Installs Ansible, but only if it's not already
# present on the machine
###
install_ansible(){

    if [ ! $(which ansible) ]
    then
       sudo apt install ansible
    fi

}

###
# Calls all the other functions in the script
###
main(){
    configure_sudoers
    install_ansible
}

main

