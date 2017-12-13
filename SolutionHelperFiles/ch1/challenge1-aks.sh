#!/bin/bash

# Create a service principal if you haven't done so already:
# az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/mySubscriptionID"

RG_NAME='kwood-aks-westus2' #Use the RG assigned to you at login of Sponsored Account
ACS_NAME='kwood-aks' #Change the xxx to your initials
SSH_KEY_PATH='~/.ssh/id_rsa.pub'
MASTER_OS_DISK=50
AGENT_OS_DISK=120
SP_NAME=' b20a510b-9e90-48d2-9298-3d731680e982' # Use Service Prinicpal name assigned in welcome email
SP_SECRET='14n6BEKbqnqqrC6cdyW+pitVDERnc2mb4qxGmoQLEdg=' # Use Service Prinicpal client secret assigned in welcome email
DNS_PREFIX='kwood-aks' #Change xxx to your initials
VM_SIZE='Standard_D2_v2'
ADMIN_NAME='kwood-aks' #Change xxx to your initials


az aks create -g $RG_NAME -n $ACS_NAME  \
--ssh-key-value $SSH_KEY_PATH --service-principal $SP_NAME --client-secret  \
$SP_SECRET --dns-name-prefix $DNS_PREFIX --agent-count 2 --agent-vm-size $VM_SIZE \
--agent-osdisk-size $AGENT_OS_DISK \
--admin-username $ADMIN_NAME
