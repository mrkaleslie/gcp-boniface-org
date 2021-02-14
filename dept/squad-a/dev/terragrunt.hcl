locals {
  env = "dev"
  # # project = ${replace(replace(get_terragrunt_dir(), get_parent_terragrunt_dir(), ""), "/", "-")}
  # project    = "dept-squad-a-dev"
  # squad_vars = read_terragrunt_config(find_in_parent_folders("squad.hcl"))
  # cidr       = local.squad_vars.locals.vpc[local.env]
}

dependencies {
  paths = ["../folder", "../../../transport/${local.env}"]
}

dependency "squad_folder" {
  config_path                             = "../folder"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
    id = "folders/123456"
  }
}

dependency "transport" {
  config_path                             = "../../../transport/${local.env}"
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
  }
}

terraform {
  source = "../../..//modules/squad"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  parent          = dependency.squad_folder.outputs.id
  org             = "bon"
  name            = "dept-squad-a-dev"
  subnets         = []
}
