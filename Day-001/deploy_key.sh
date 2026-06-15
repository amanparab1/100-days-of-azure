# Dynamic resource group query
az group list --query "[].name" -o tsv

# SSH Key generation
az sshkey create --name devops-kp --resource-group kml_rg_main-3d96ab00a1334d01
