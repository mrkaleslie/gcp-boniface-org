resource "google_folder" "this" {
  display_name = "transport"
  parent       = "organizations/1077773425109"
}
output "folder_id" {
  value = google_folder.this.name
}