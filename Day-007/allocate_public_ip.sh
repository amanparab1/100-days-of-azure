#!/bin/bash
# Nautilus DevOps Cloud Workload Migration - Day 7
# Objective: Allocate standalone Public IP address resource ('xfusion-pip').

set -e

echo "Discovering dynamic cloud resource group context..."
RESOURCE_GROUP=$(az group list --query "[].name" -o tsv)

echo "Allocating standalone external Public IP (PIP) resource..."
az network public-ip create \
  --resource-group "$RESOURCE_GROUP" \
  --name xfusion-pip \
  --sku Standard \
  --allocation-method Static

echo "Validating Public IP allocation pipeline status..."
az network public-ip list \
  --resource-group "$RESOURCE_GROUP" \
  --query "[].{Name:name, SKU:sku.name, Allocation:publicIPAllocationMethod, ProvisionState:provisioningState}" \
  -o table
