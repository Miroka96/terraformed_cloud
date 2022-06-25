terraform {
  required_version = ">= 1.2.3"

  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.33.2"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

