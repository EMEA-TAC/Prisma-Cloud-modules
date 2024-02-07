resource "google_compute_firewall" "allow-pcce" {
  name = "allow-pcce-${var.name}"
  network = var.network
  allow {
    protocol = "tcp"
    ports = ["8083","8084"]
  }
  target_tags = ["pcce-${var.name}"]
  source_ranges = ["0.0.0.0/0"]
}

data "template_file" "init" {
    template = "${file("${path.module}/script.sh")}"
    vars = {
      version = var.pcc-version
      tar = var.pcc-tar
    }
}

resource "google_compute_instance" "onebox-instance" {
  name = "pcce-${var.name}"
  zone = var.zone
  machine_type = "e2-standard-4"

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    subnetwork = var.network
  }

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/debian-11-bullseye-v20230629"
      size  = 10
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }
  
  tags = ["ssh", "pcce-${var.name}"]
  
  metadata_startup_script = data.template_file.init.rendered  
}
