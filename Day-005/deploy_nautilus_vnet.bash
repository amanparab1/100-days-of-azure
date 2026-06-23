#!/bin/bash
# Objective: Provision an isolated VNet for incremental infrastructure migration.
# Region: eastus | CIDR: 192.168.0.0/24

set -e

echo "Fetching dynamic resource group handle..."
RESOURCE_GROUP=$(az group list --query "[].name" -o tsv)

echo "Deploying network boundary: 'nautilus-vnet'..."
az network vnet create \
  --resource-group "$RESOURCE_GROUP" \
  --name nautilus-vnet \
  --location eastus \
  --address-prefixes 192.168.0.0/24

echo "Verifying deployment topology..."
az network vnet show --resource-group "$RESOURCE_GROUP" --name nautilus-vnet --query "provisioningState" -o tsv
