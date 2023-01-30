locals {
  data_lake_bucket = "zoomcamp_data_lake"
}

variable "project" {
  description = "Your GCP Project ID"
  default     = "de-zoomcamp-376211"
}

variable "region" {
  description = "Region for GCP resources."
  default     = "europe-west3"
  type        = string
}

variable "storage_class" {
  description = "Storage class type for your bucket."
  default     = "STANDARD"
}

variable "BQ_DATASET" {
  description = "BigQuery Dataset that raw data (from GCS) will be written to"
  type        = string
  default     = "trips_data_all"
}

variable "credentials" {
  description = "Path to credentials file"
}
