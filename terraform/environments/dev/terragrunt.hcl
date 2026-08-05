include {
  path = find_in_parent_folders()
}

terraform {
  source = "../..//environments/dev"
}

inputs = {
  environment          = "dev"
  machine_type         = "e2-medium" 
  node_count           = 1           
  enable_private_nodes = false
}
