# Terraform Azure Modules

This repository contains Terraform modules for deploying infrastructure on Azure. It includes modules for creating Azure Kubernetes Service (AKS) clusters, Virtual Networks (VNet), and the backend infrastructure for Terraform state management.

## Modules

- **AKS**: Deploys an Azure Kubernetes Service cluster based on best practices. See the [AKS module](aks/README.md) for more details.
- **Virtual Network**: Deploys a Virtual Network. This module is based on the [Azure Architecture Center best practices](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/containers/aks/baseline-aks). See the [VNet module](vnet/README.md) for more details.
- **Terraform Backend**: Sets up Azure resources for storing Terraform state files securely. See the [Terraform Backend module](terraform-backend/README.md) for more details.

## Getting Started

To use these modules, you need to have Terraform installed and configured for Azure. Each module's directory contains specific instructions on how to use it.

1. Clone this repository to your local machine.
2. Navigate to the module you wish to deploy (e.g., `cd aks`).
3. Follow the instructions in the module's `README.md` file.

## Prerequisites

- An Azure account
- Terraform 1.5.4 or later

## License

This project is licensed under the Apache License - see the [LICENSE](LICENSE.txt) file for details.
