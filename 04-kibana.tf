# configure kibana container
resource "docker_container" "kibana" {
  name  = "kibana"
  image = docker_image.kibana.image_id

  restart = "unless-stopped"

  ports {
    internal = 5601
    external = 5601
  }

  # Mount local kibana.yml to container
  mounts {
    type      = "bind"
    source    = "C:/Users/carlton/Documents/TheoWAF/class7/AWS/Personal_labs/ELK_Stack/kibana/config/kibana.yml"
    target    = "/usr/share/kibana/config/kibana.yml"
    read_only = true
  }

  # Mount pesistent data volume (may change later)
  mounts {
    type   = "volume"
    source = docker_volume.kibana-data.name
    target = "/usr/share/kibana/data"
  }

  mounts {
    type = "bind"
    source = "C:/Users/carlton/Documents/TheoWAF/class7/AWS/Personal_labs/ELK_Stack/kibana/config/certs/"
    target = "/usr/share/kibana/config/certs/"
    read_only = true 
  }

  env = [
    "ELASTICSEARCH_HOSTS=https://elasticsearch:9200"
  ]

  networks_advanced {
    name = docker_network.elk.name
  }

  depends_on = [
    docker_container.elasticsearch
  ]

}

