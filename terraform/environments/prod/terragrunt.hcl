include {
  path = find_in_parent_folders()
}

terraform {
  source = "../..//environments/prod"
}

inputs = {
  environment          = "prod"
  machine_type         = "e2-standard-2"
  node_count           = 2               
  enable_private_nodes = true            
}
