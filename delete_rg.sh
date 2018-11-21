#!/bin/bash

#Verify Resource Group Exists
read -p 'Resource Group Name: ' rg_name
echo
echo Looking for resource group: $rg_name
echo

#look for resource group, create it if missing
rg_result=$(az group exists --name $rg_name)
if [ $rg_result = true ]; then
    echo Resource group $rg_name exists
else
    echo Resouce group $rg_name is missing
    echo Now ending...
fi

echo Now deleting $rg_name
az group delete --name $rg_name --no-wait --yes

exit