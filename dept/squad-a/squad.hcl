locals {
  name = "squad-a"

  vpc = {
    dev = "10.0.1.0/24"
    stg = "10.0.2.0/24"
    prd = "10.0.3.0/24"
  }
}