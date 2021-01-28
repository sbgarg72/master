terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("key-test-ajit-service.json")
  project = "test-ajit-service"
  region  = var.my_vpc_region_us
  zone    = var.my_zone1
  #"us-central1-a"
}

resource "google_compute_network" "automation_vpc_network" {
  name = var.my_vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "automation-subnet-us" {
  name          = var.my_subnet1
  ip_cidr_range = "175.10.0.0/24"
  region        = var.my_vpc_region_us
  network       = google_compute_network.automation_vpc_network.id
}

resource "google_compute_subnetwork" "automation-subnet-eu" {
  name          = var.my_subnet2
  ip_cidr_range = "175.10.1.0/24"
  region        = var.my_vpc_region_eu
  network       = google_compute_network.automation_vpc_network.id
}

