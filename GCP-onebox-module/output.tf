output "external_ip" {
  value = "https://${google_compute_instance.onebox-instance.network_interface[0].access_config[0].nat_ip}:8083"
}