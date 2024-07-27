variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-openai-chat"
}

variable "location" {
  description = "The location of the resource group"
  type        = string
  default     = "eastus"
}

variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
  default     = "acrOpenAIChat"
}

variable "openai_name" {
  description = "The name of the Azure OpenAI Service"
  type        = string
  default     = "openaiService"
}

variable "search_name" {
  description = "The name of the Azure Search Service"
  type        = string
  default     = "searchService"
}
