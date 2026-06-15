# 100 Days of Azure Cloud Challenge ☁️

Welcome to my 100-day challenge logbook. This repository serves as a tracking hub for my daily progress in mastering Azure cloud infrastructure, access management, and core systems engineering as I prepare for the **AZ-104** certification.

## 🛠️ Technology Stack
*   **Cloud Platform:** Microsoft Azure
*   **Operating System:** Linux (Pop!_OS)
*   **Core Focus:** IAM, Cloud Networking, Compute Automation, Security

---

## 📈 Daily Progress Log

| Day | Date | Focus Area | Core Concept / Task | Documentation / Code |
| :---: | :---: | :--- | :--- | :--- |
| **001** | 2026-06-15 | Infrastructure Security | Provisioning an RSA SSH Key Pair via Azure CLI | [Link to Day 1 Folder](./Day-001) |

---

## 📝 Detailed Logbook

### Day 1: Infrastructure Security & CLI Foundations
*   **What I built/learned:** 
    *   Explored incremental cloud migration strategies by segmenting large deployment tasks into smaller architecture pieces.
    *   Used the Azure CLI to dynamically query active lab resource groups using JSON queries formatted as clean TSV output.
    *   Generated an RSA-type SSH key pair (`devops-kp`) directly stored as an Azure resource to establish secure access control management for compute instances.
*   **Challenges faced:** Had to handle the initial login flow cleanly within a headless remote client environment.
*   **How I solved it:** Shifted from inline authentication to the interactive device code flow using `az login --use-device-code` to bypass credential validation security blocks.
*   **Code/Scripts used:**
```bash
    # Query resource group
    az group list --query "[].name" -o tsv

    # Create the RSA key pair resource
    az sshkey create --name devops-kp --resource-group <RESOURCE_GROUP_NAME>
    ```
