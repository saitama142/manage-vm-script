#!/bin/bash

# Configuration variables
vmName=${VM_NAME:-"your_vm_name"}
resourceGroup=${RESOURCE_GROUP:-"your_resource_group"}
sshKeyPath=${SSH_KEY_PATH:-"/path/to/your/ssh_key.pem"}
sshUserName=${SSH_USER_NAME:-"your_username"}

# Check the status of the VM
echo "Checking VM status..."
vmStatus=$(az vm get-instance-view --name $vmName --resource-group $resourceGroup --query "instanceView.statuses[1].displayStatus" --output tsv)

# If the VM is deallocated, then start it
if [[ $vmStatus == "VM deallocated" ]]; then
    echo "Starting VM..."
    az vm start --name $vmName --resource-group $resourceGroup
    echo "VM is starting, please wait..."
    # Wait for the VM to start up
    sleep 60
else
    echo "VM is already running."
fi

# Get the current public IP address of the VM
currentIP=$(az vm list-ip-addresses --name $vmName --resource-group $resourceGroup --query "[].virtualMachine.network.publicIpAddresses[0].ipAddress" -o tsv)

# SSH into the VM using the current IP
echo "Connecting to VM via SSH using IP $currentIP..."
ssh -i $sshKeyPath $sshUserName@$currentIP

# When SSH session is closed, prompt to shut down the VM
read -p "Press Enter to shut down the VM or CTRL+C to cancel..."

# Deallocate the VM to stop incurring charges
echo "Shutting down VM..."
az vm deallocate --name $vmName --resource-group $resourceGroup
echo "VM has been shut down."
