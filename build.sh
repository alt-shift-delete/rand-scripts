#!/bin/bash

#Set resource group to be used
read -p 'Resource Group Name: ' rg_name
echo
echo Looking for resource group: $rg_name
echo

#look for resource group, create it if missing
rg_result=$(az group exists --name $rg_name)
if [ $rg_result = true ]; then
    echo Resource group $rg_name exists
else
    read -p 'That resource group dosent exists, would you like to create it [y/n]? ' ans
    if [ $ans = y ] ; then
        az group create --name $rg_name --location westus2
    fi
fi
echo

#Build the VM
read -p 'Would you like to spin up a unix VM in the Reasource Group now? [y/n]' new_vm
read -p 'Enter the Image name you would like to use (Ask the site Admin for approved image names): ' img
read -p 'Enter the hostname for your new VM:  ' hostname
read -p 'Enter the admin user name for the local administrator: ' admin
read -p 'Supply your password, for Windows VMs, or, paste your ssh key for Unix VMs: ' token
az vm create --resource-group $rg_name --name $hostname --admin-username $admin --image $img --ssh-key-value "$(< $token)"
