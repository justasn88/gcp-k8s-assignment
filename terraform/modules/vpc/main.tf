resource "google_compute_network" "vpc" {
  name                    = "vpc-${var.environment}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "subnet-${var.environment}-${var.region}"
  ip_cidr_range = var.environment == "dev" ? "10.10.0.0/24" : "10.20.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc.id
  
  secondary_ip_range {
    range_name    = "pod-range"
    ip_cidr_range = var.environment == "dev" ? "10.100.0.0/16" : "10.200.0.0/16"
  }
  
  secondary_ip_range {
    range_name    = "service-range"
    ip_cidr_range = var.environment == "dev" ? "10.101.0.0/20" : "10.201.0.0/20"
  }
}
