remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "cand-a3-202608-tfstate"
    prefix = "${path_relative_to_include()}/terraform.tfstate"
  }
}
