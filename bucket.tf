### Start of bucket zype-demo-sre and it's policy
resource "google_storage_bucket" "zype_demo" {
  name          = "zype-demo-sre"
  location      = "US"
  force_destroy = true

  storage_class = "STANDARD"
  versioning {
    enabled = "true"
  }
}

data "google_iam_policy" "zype_demo_read_access" {
  binding {
    role = "role/storage.objectViewer"
    members = [
      "serviceAccount:${google_service_account.zype_demo.name}"
    ]
  }
}

resource "google_storage_bucket_iam_policy" "zype_demo" {
  bucket = google_storage_bucket.zype_demo.name
  policy_data = data.google_iam_policy.zype_demo_read_access.policy_data
}
### End of bucket zype-demo-sre and it's policy
