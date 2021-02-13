locals {

}

dependencies {
  paths = ["../folder"]
}

dependency "folder" {
  config_path = "../folder"
  # skip_outputs = true
  # Configure mock outputs for the `validate` command that are returned when there are no outputs available (e.g the
  # module hasn't been applied yet.
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
    id = "folders/123456"
  }
}
include {
  path = find_in_parent_folders()
}

inputs = {
  name = "dev"
}