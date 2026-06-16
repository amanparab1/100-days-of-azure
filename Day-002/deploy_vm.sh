#!/bin/bash

# Target VM deployment script using dynamic resource group queries
az vm create \
  --resource-group $(az group list --query "[].name" -o tsv) \
  --name devops-vm \
  --location westus \
  --image Canonical:ubuntu-24_04-lts:server:latest \
  --size Standard_B1s \
  --storage-sku Standard_LRS \
  --os-disk-size-gb 30 \
  --nsg-rule SSH \
  --admin-username azureuser \
  --generate-ssh-keys
