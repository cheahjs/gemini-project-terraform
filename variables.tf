variable "name" {
  type        = string
  description = "Name of the project"
}

variable "id" {
  type        = string
  description = "ID of the project"
}

variable "org_id" {
  type        = string
  description = "ID of the organization to attach the project to"
  default     = null
  nullable    = true
}

variable "billing_account" {
  type        = string
  description = "ID of the billing account to attach the project to"
  default     = null
  nullable    = true
}

variable "api_key_name" {
  type        = string
  description = "Name of the API key to use with the Gemini API"
  default     = null
  nullable    = true
}

variable "api_key_display_name" {
  type        = string
  description = "Display name of the API key to use with the Gemini API"
  default     = null
  nullable    = true
}
