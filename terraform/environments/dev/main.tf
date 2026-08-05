provider "google" {
  project = "cand-a3-202608"
  region  = "europe-west1"
}

variable "environment" {}
variable "machine_type" {}
variable "node_count" {}
variable "enable_private_nodes" {}

module "vpc" {
  source      = "../../modules/vpc"
  project_id  = "cand-a3-202608"
  region      = "europe-west1"
  environment = var.environment
}

module "gke" {
  source               = "../../modules/gke"
  project_id           = "cand-a3-202608"
  region               = "europe-west1"
  environment          = var.environment
  machine_type         = var.machine_type
  node_count           = var.node_count
  enable_private_nodes = var.enable_private_nodes

  network_name       = module.vpc.network_name
  subnet_name        = module.vpc.subnet_name
  pod_range_name     = module.vpc.pod_range_name
  service_range_name = module.vpc.service_range_name
}
