resource "google_compute_firewall" "fwr-http-allow" {
  name    = "fwr-http-allow"
  network = google_compute_network.automation_vpc_network.name
  description = "firewall rule to allow http traffic to tag-webserver"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  
  direction = "INGRESS"
  priority = 1000
  source_ranges = ["0.0.0.0/0"]
  
  target_tags = ["tag-webserver"]
  
}

resource "google_compute_firewall" "fwr-https-allow" {
  name    = "fwr-https-allow"
  network = google_compute_network.automation_vpc_network.name
  description = "firewall rule to allow https traffic to tag-webserver"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  
  direction = "INGRESS"
  priority = 1000
  source_ranges = ["0.0.0.0/0"]
  
  target_tags = ["tag-webserver"]
  
}

resource "google_compute_firewall" "fwr-ssh-allow" {
  name    = "fwr-ssh-allow"
  network = google_compute_network.automation_vpc_network.name
  description = "firewall rule to allow ssh traffic to tag-ssh-allow"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  
  direction = "INGRESS"
  priority = 1000
  source_ranges = ["0.0.0.0/0"]
  
  target_tags = ["tag-ssh-allow"]
  
}

resource "google_compute_firewall" "fwr-icmp-allow" {
  name    = "fwr-icmp-allow"
  network = google_compute_network.automation_vpc_network.name
  description = "firewall rule to allow ssh traffic to tag-icmp-allow"

  allow {
    protocol = "icmp"
    #ports    = ["22"]
  }
  
  direction = "INGRESS"
  priority = 1000
  source_ranges = ["0.0.0.0/0"]
  
  target_tags = ["tag-icmp-allow"]
  
}