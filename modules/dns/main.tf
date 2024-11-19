terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

variable "zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}

variable "records" {
  description = "DNS records to create"
  type = list(object({
    name    = string
    value   = string
    type    = string
    proxied = bool
    ttl     = optional(number, 1)  
    priority = optional(number)     
  }))
}

resource "cloudflare_record" "records" {
  for_each = { for idx, record in var.records : "${record.type}-${record.name}" => record }
  
  zone_id  = var.zone_id
  name     = each.value.name
  value    = each.value.value
  type     = each.value.type
  proxied  = each.value.proxied
  ttl      = each.value.ttl
  priority = each.value.priority
}

output "record_ids" {
  description = "Map of created DNS record IDs"
  value = { for k, v in cloudflare_record.records : k => v.id }
}


# 모든 DNS 레코드 정보
output "dns_records" {
  description = "All DNS records"
  value = {
    for k, v in cloudflare_record.records : k => {
      name    = v.name
      type    = v.type
      content = v.content
      proxied = v.proxied
    }
  }
}

# Proxied된 레코드만 따로 보기
output "proxied_records" {
  description = "Proxied DNS records"
  value = {
    for k, v in cloudflare_record.records : k => {
      name    = v.name
      type    = v.type
      content = v.content
    }
    if v.proxied == true
  }
}

# 레코드 타입별 개수
output "record_count_by_type" {
  description = "Count of records by type"
  value = {
    for type in distinct([for r in cloudflare_record.records : r.type]) : type => length([
      for r in cloudflare_record.records : r
      if r.type == type
    ])
  }
}
