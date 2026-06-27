#!/bin/bash
# Nautilus DevOps Cloud Workload Migration - Day 6
# Objective: Scripted deployment of 'nautilus-vnet' and nested 'nautilus-subnet'.
# Region: westus | VNet CIDR: 10.0.0.0/16 | Subnet CIDR: 10.0.0.0/24

set -e

echo "Querying dynamic resource allocation wrappers..."
RESOURCE_GROUP=$(az group list --query "[].name" -o tsv)

echo "Provisioning Software-Defined Network Layout & Subnet Infrastructure..."
az network vnet create \
  --resource-group "$RESOURCE_GROUP" \
  --name nautilus-vnet \
  --location westus \
  --address-prefixes 10.0.0.0/16 \
  --subnet-name nautilus-subnet \
  --subnet-prefixes 10.0.0.0/24

echo "Executing post-deployment pipeline validation..."
az network vnet subnet list \
  --resource-group "$RESOURCE_GROUP" \
  --vnet-name nautilus-vnet \
  --query "[].{Name:name, Prefix:addressPrefix, ProvisionState:provisioningState}" \
  -o table
