terraform {
  required_version = ">= 0.15.0"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "~>0.6.3"
    }
  }
}

