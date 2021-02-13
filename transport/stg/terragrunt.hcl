locals {

}

dependencies {
  paths = ["../folder"]
}

dependency "folder" {
  config_path                             = "../folder"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
    id = "folders/123456"
  }
}

terraform {
  source = "../..//modules/transport"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  parent          = dependency.folder.outputs.id
  org             = "bon"
  name            = "transport-prd"
  subnets         = []
  shared_vpc_host = false
}