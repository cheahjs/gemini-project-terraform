resource "random_pet" "project" {
  length = 3
}

resource "google_project" "project" {
  name            = var.name
  project_id      = var.id ? var.id : random_pet.project.id
  org_id          = var.org_id
  billing_account = var.billing_account
}

resource "google_project_service" "gemini" {
  project = google_project.project.project_id
  service = "generativelanguage.googleapis.com"
}

resource "google_apikeys_key" "gemini" {
  count = var.api_key_name ? 1 : 0

  project      = google_project.project.project_id
  name         = var.api_key_name
  display_name = var.api_key_display_name

  restrictions {
    api_targets {
      service = google_project_service.gemini.service
    }
  }
}

output "project_id" {
  value = google_project.project.project_id
}

output "api_key" {
  value = var.api_key_name ? google_apikeys_key.gemini[0].key_string : ""
}
