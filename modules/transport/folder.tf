resource "google_folder" "this" {
  display_name = local.env
  parent       = var.parent
}
