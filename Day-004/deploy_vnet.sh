#!/bin/bash
# Nautilus DevOps Cloud Workload Migration - Day 4
# Objective: Programmatic instantiation of a core enterprise Virtual Network topology.

az network vnet create \
  --resource-group $(az group list --query "[].name" -o tsv) \
  --name devops-vnet \
  --location eastus \
  --address-prefixes 10.0.0.0/16
