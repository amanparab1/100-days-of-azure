#!/bin/bash
# Nautilus DevOps Cloud Workload Migration - Day 3
# Objective: Headless deployment of an Ubuntu 22.04 LTS instance with optimized B-series performance tiers.

az vm create \
  --resource-group $(az group list --query "[].name" -o tsv) \
  --name devops-vm \
  --image Ubuntu2204 \
  --size Standard_B2s \
  --admin-username azureuser \
  --generate-ssh-keys \
  --storage-sku Standard_LRS \
  --os-disk-size-gb 30
