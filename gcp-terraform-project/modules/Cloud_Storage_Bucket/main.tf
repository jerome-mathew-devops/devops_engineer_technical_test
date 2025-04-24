resource "google_storage_bucket" "static-site" {
  name          = var.bucket_name
  location      = var.bucket_location
  storage_class = var.storage_class
  force_destroy = true #Allows bucket to be destroy if bucket is empty

  uniform_bucket_level_access = true

}

resource "google_storage_bucket_object" "test_html" {
  name   = var.object_name
  source = "index.html"
  bucket = google_storage_bucket.static-site.name
}