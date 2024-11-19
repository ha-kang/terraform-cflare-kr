terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
  
  # S3 백엔드 설정 (선택사항)
  backend "s3" {
    bucket = "your-terraform-state-bucket"
    key    = "cloudflare/terraform.tfstate"
    region = "ap-northeast-2"
    encrypt = true
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
