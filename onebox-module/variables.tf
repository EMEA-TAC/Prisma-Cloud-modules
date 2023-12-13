variable "name" {
  type = string
}
variable "zone" {
  type = string
  default = "europe-southwest1-a"
}
variable "startup" {
  type = string
  default = "script.sh"
}
variable "network" {
  type = string
  default = "default"
}
variable "pcc-version" {
    type = string
    default = "https://cdn.twistlock.com/releases/SkfIRVkk/prisma_cloud_compute_edition_31_03_103.tar.gz"  
}

variable "pcc-tar" {
  type = string
  default = "prisma_cloud_compute_edition_31_03_103.tar.gz"
}