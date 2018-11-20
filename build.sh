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
   echo az group create --name $rg_name --location westus2
 fi
fi
echo

#Build the Unix VM
read -p 'Would you like to spin up a VM in the Reasource Group now? [y/n]' new_ux_vm
read -p 'Enter the Image name you would like to use: ' ux_img
read -p 'Enter the hostname for your new VM:  ' ux_hostname
read -p 'Enter the admin user name for the local administrator: ' ux_admin
read -p 'Paste your public ssh key here: ' ssh_key
echo $ux_img - $ux_hostname - $ux_admin - $ssh_key

#Build a Windows VM