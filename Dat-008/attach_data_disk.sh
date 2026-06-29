#!/bin/bash
# Nautilus DevOps Cloud Workload Migration - Day 8
# Objective: Attach existing managed storage disk ('devops-disk') to compute instance ('devops-vm').

set -e

echo "Querying active resource group namespace..."
RESOURCE_GROUP=$(az group list --query "[].name" -o tsv)

echo "Attaching managed data disk to target virtual machine..."
az vm disk attach \
  --resource-group "$RESOURCE_GROUP" \
  --vm-name devops-vm \
  --name devops-disk

echo "Auditing VM storage profile and initialization state..."
az vm show \
  --resource-group "$RESOURCE_GROUP" \
  --name devops-vm \
  --query "storageProfile.dataDisks[].{Name:name, LUN:lun, Caching:caching}" \
  -o table
