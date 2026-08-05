output "network_name"       { value = google_compute_network.vpc.name }
output "subnet_name"        { value = google_compute_subnetwork.subnet.name }
output "pod_range_name"     { value = "pod-range" }
output "service_range_name" { value = "service-range" }
