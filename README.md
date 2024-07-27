# Azure OpenAI Chat App for Employee Benefits

## Introduction
This project demonstrates how to deploy and run a chat application using Python, Azure OpenAI Service, and Retrieval Augmented Generation (RAG) in Azure AI Search. The app provides detailed answers about employee benefits at a fictitious company, using data from PDF files such as the employee handbook, benefits document, and a list of company roles and expectations.

## Prerequisites
- Azure Subscription
- Python 3.8+
- Azure OpenAI Service
- Azure AI Search

## Setup Instructions
1. Clone the repository:
    ```sh
    git clone https://github.com/sameeullahsiddiqui/azure-openai-chat-employee-benefits.git
    ```
2. Navigate to the project directory:
    ```sh
    cd azure-openai-chat-employee-benefits
    ```
3. Install dependencies:
    ```sh
    pip install -r requirements.txt
    ```

## Infrastructure as Code (IaC)
1. Set up Terraform:
    - Install Terraform: [Terraform Install Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)
    - Initialize Terraform:
        ```sh
        terraform init
        ```
    - Apply Terraform configuration:
        ```sh
        terraform apply
        ```
    - Follow prompts to confirm deployment.

## CI/CD Pipeline
1. Set up GitHub Actions for CI/CD:
    - Create a `.github/workflows` directory in the repository.
    - Add a workflow file for CI/CD (e.g., `deploy.yml`):
    ```yaml
    name: CI/CD Pipeline

    on:
      push:
        branches:
          - main

    jobs:
      build:
        runs-on: ubuntu-latest
        steps:
          - name: Checkout code
            uses: actions/checkout@v2

          - name: Set up Python
            uses: actions/setup-python@v2
            with:
              python-version: 3.8

          - name: Install dependencies
            run: |
              python -m pip install --upgrade pip
              pip install -r requirements.txt

          - name: Run tests
            run: |
              pytest

          - name: Deploy to Azure
            env:
              AZURE_SUBSCRIPTION_ID: ${{ secrets.AZURE_SUBSCRIPTION_ID }}
              AZURE_CLIENT_ID: ${{ secrets.AZURE_CLIENT_ID }}
              AZURE_CLIENT_SECRET: ${{ secrets.AZURE_CLIENT_SECRET }}
              AZURE_TENANT_ID: ${{ secrets.AZURE_TENANT_ID }}
            run: |
              terraform init
              terraform apply -auto-approve
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
