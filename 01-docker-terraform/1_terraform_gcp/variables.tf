variable "credentials" {
  description = "My credentials"
  default     = "/Users/johnpham/Documents/Projects/data-engineering-zoomcamp/01-docker-terraform/2_docker_sql/keys/my-creds.json"
}

variable "project" {
  description = "Project"
  default     = "terraform-demo-412101"

}

variable "location" {
  description = "Project Location"
  default     = "US"
}

variable "region" {
  description = "Region"
  default     = "us-east1"
}

variable "bq_dataset_name" {
  description = "My Bigquery Dataset Name"
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "terraform-demo-412101-terra-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}