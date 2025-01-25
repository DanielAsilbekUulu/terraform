provider "google" {
  project = "peerless-glass-445921-v5"
  region = "us-central1"
}

resource "google_compute_instance" "instance-practice-gcp" {
  name         = "my-instance-google"
  machine_type = "e2-micro"
   zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  #scratch_disk {
  #  interface = "NVME"      #required
  #}

  network_interface {
    network = "default"

    access_config {     # this part enables the public ip
      // Ephemeral public IP
    }
  }
}