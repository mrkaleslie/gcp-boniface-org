variable "parent" { type = string }
variable "org" { type = string }
variable "name" { type = string }
variable "subnets" { type = list(map(string)) }
variable "shared_vpc_host" { type = bool }

locals {
    envs = list("dev", "stg", "prd")
    env  = join("", matchkeys(local.envs, local.envs, split("-", var.name)))
}