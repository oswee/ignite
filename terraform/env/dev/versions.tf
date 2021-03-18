terraform {
  required_version = ">= 0.14.7"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "~>0.6.3"
    }
  }
}

