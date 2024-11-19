module "dns" {
  source = "../../modules/dns"

  zone_id = var.cloudflare_zone_id
  records = [
    {
      name = "api.cflare.kr"
      value = "3.36.132.43"
      type = "A"
      proxied = true
    },
    {
      name = "api-gateway.cflare.kr"
      value = "35.232.8.56"
      type = "A"
      proxied = true
    },
    {
      name = "baekjun.cflare.kr"
      value = "13.125.84.218"
      type = "A"
      proxied = true
    },
    {
      name = "hakang.cflare.kr"
      value = "3.36.132.43"
      type = "A"
      proxied = true
    },
    {
      name = "hkk-cdn.cflare.kr"
      value = "13.125.167.37"
      type = "A"
      proxied = false
    },
    {
      name = "hkk.cflare.kr"
      value = "13.125.167.37"
      type = "A"
      proxied = true
    },
    {
      name = "sunni1227.cflare.kr"
      value = "3.36.132.43"
      type = "A"
      proxied = true
    },
    {
      name = "test.cflare.kr"
      value = "2606:4700::6812:127b"
      type = "AAAA"
      proxied = true
    },
    {
      name = "maintenance.cflare.kr"
      value = "pages-test-387.pages.dev"
      type = "CNAME"
      proxied = true
    },
    {
      name = "usage.cflare.kr"
      value = "pages-359.pages.dev"
      type = "CNAME"
      proxied = true
    },
    {
      name = "cloudflare-ip.cflare.kr"
      value = "100::"
      type = "AAAA"
      proxied = true
    },
    {
      name = "maintenance-page.cflare.kr"
      value = "100::"
      type = "AAAA"
      proxied = true
    },
    {
      name = "usage-trigger.cflare.kr"
      value = "100::"
      type = "AAAA"
      proxied = true
    }
  ]
}



   output "dns_records" {
    description = "All DNS records from DNS module"
    value       = module.dns.dns_records
  }

  output "proxied_records" {
    description = "Proxied DNS records from DNS module"
    value       = module.dns.proxied_records
  }

  output "record_count_by_type" {
    description = "Count of records by type from DNS module"
    value       = module.dns.record_count_by_type
  }
  
