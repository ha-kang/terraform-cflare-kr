variable "cloudflare_email" {
  description = "Cloudflare Email Address"
  type        = string
}

variable "cloudflare_api_key" {
  description = "Cloudflare API Key"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}

variable "domain" {
  description = "Domain name"
  type        = string
  default     = "cflare.kr"
}
