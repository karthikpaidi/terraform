terraform {
  required_providers {
    docker = {
      source = "terraform-providers/docker"
    }
  }
}

provider "docker" {}

resource "docker_image" "influxdbv2" {
  //this image is from the influx official site
  //https://docs.influxdata.com/influxdb/v2.0/get-started/
  name         = "quay.io/influxdb/influxdb:2.0.0-rc"
  keep_locally = false
}

resource "docker_container" "influxdbv2" {
  image = docker_image.influxdbv2.latest
  name  = "influxdbv2"
  ports {
    internal = 8086
    external = 8086
  }
  volumes {
      /*if you have a specific path to use as volume mount
        please updat the /var/tmp/influxdbv2 to use that specific path
        Note: terraform takes only absolute path here
      */
      host_path = "/var/tmp/influxdbv2"
      container_path = "/var/lib/influxdb"
  }
}
