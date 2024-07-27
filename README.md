# Azure OpenAI Chat App for Employee Benefits

## Introduction
This project demonstrates how to deploy and run a chat application using Python, Azure OpenAI Service, and Retrieval Augmented Generation (RAG) in Azure AI Search. The app provides detailed answers about employee benefits at a fictitious company, using data from PDF files such as the employee handbook, benefits document, and a list of company roles and expectations.

## Prerequisites
- Azure Subscription
- Python 3.8+
- Azure OpenAI Service
- Azure AI Search
- Docker
- Terraform (if using IaC)

## Setup Instructions

1. Clone the repository:
    ```sh
    git clone https://github.com/sameeullahsiddiqui/azure-openai-chat-employee-benefits.git
    ```

2. Navigate to the project directory:
    ```sh
    cd azure-openai-chat-employee-benefits
    ```

3. Set up a virtual environment:
    ```sh
    python -m venv venv
    source venv/bin/activate   # On Windows, use `venv\Scripts\activate`
    ```

4. Install dependencies:
    ```sh
    pip install -r requirements.txt
    ```

## Azure Setup
### Get Subscription ID, Client ID, Client Secret, and Tenant ID

1. **Subscription ID**:
    - Go to the Azure portal: [Azure Portal](https://portal.azure.com)
    - Navigate to "Subscriptions".
    - Copy the Subscription ID of the relevant subscription.

2. **Tenant ID**:
    - In the Azure portal, navigate to "Azure Active Directory".
    - Copy the Tenant ID from the "Overview" section.

3. **Client ID and Client Secret**:
    - Navigate to "Azure Active Directory" -> "App registrations" -> "New registration".
    - Register a new application.
      - Name: `azure-openai-chat-employee-benefits`
      - Supported account types: "Accounts in this organizational directory only"
    - After registration, navigate to "Certificates & secrets" -> "New client secret".
      - Add a description and set an expiration period.
      - Copy the Client Secret (it will be shown only once).
    - Go to "Overview" to copy the Application (client) ID.

## Azure Container Registry (ACR) Setup

1. **Create Azure Container Registry**:
    - Navigate to the Azure portal.
    - Go to "Create a resource" -> "Containers" -> "Container Registry".
    - Fill in the necessary details:
      - Registry name: `yourRegistryName`
      - Resource group: `yourResourceGroup`
      - Location: Choose the desired location
      - SKU: Basic
    - Click "Review + create" and then "Create".

2. **Configure Azure Container Registry**:
    - After the ACR is created, navigate to the registry.
    - Go to "Access keys" and enable the admin user.
    - Copy the `Login server`, `Username`, and `Password`.

## Creating Azure OpenAI and Azure Search Resources

You have two options for creating these resources: **Manual Creation** or **Using Terraform (IaC)**.

### Option 1: Manual Creation
1. **Create Azure OpenAI Service**:
    - Navigate to the Azure portal.
    - Click "Create a resource" -> "AI + Machine Learning" -> "Azure OpenAI".
    - Fill in the required information and create the resource.

2. **Create Azure Search Service**:
    - Navigate to the Azure portal.
    - Click "Create a resource" -> "Search" -> "Azure Cognitive Search".
    - Fill in the required information and create the resource.

### Option 2: Using Terraform (IaC)

1. Set up Terraform:
    - Install Terraform: [Terraform Install Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)
    
2. Initialize Terraform:
    ```sh
    cd terraform
    terraform init
    ```

3. Apply Terraform configuration to create Azure OpenAI, Azure AI Search, and Azure Container Registry (ACR):
    ```sh
    terraform apply -auto-approve
    ```
    - Follow prompts to confirm deployment.

## CI/CD Pipeline
1. Set up GitHub Actions for CI/CD:
    - Create a `.github/workflows` directory in the repository.
    - Add a workflow file for CI/CD (e.g., `deploy.yml`):
    ```yaml
    # (Refer to the deploy.yml configuration above)
    ```

## Usage
- How to use the chat application to get answers about employee benefits.

## Configuration
- Instructions on how to change settings to modify the behavior of responses.

## Demo
- [Watch the Demo Video](link-to-demo-video)

## Contribution Guidelines
- How to contribute to the project.

## License
- This project is licensed under the MIT License.
