resource "google_folder" "this" {
  display_name = "dev"
  # parent       = dependency.folder.outputs.folder_id
  parent       = "folders/123456789"
}
