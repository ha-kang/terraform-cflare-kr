variable "cloudflare_api_token" {
  description = "Cloudflare API Token"
  type        = string
  sensitive   = true
}

variable "cloudflare_email" {
  description = "Cloudflare Email"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}


variable "environment" {
  description = "Environment (prod/dev)"
  type        = string
}

variable "domain" {
  description = "Domain name"
  type        = string
}
