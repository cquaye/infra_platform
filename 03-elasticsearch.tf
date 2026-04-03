# configure elasticsearch container
resource "docker_container" "elasticsearch" {
  name  = "elasticsearch"
  image = docker_image.elasticsearch.image_id

  restart = "unless-stopped"

  ports {
    internal = 9200
    external = 9200
  }

  # env = [
  #   "discovery.type=single-node",
  #   "xpack.security.enabled=false"
  # ]


  networks_advanced {
    name = docker_network.elk.name
  }

  mounts {
    target = "/usr/share/elasticsearch/data"
    source = docker_volume.elasticsearch_data.name
    type   = "volume"
  }

  mounts {
    target = "/usr/share/elasticsearch/config/elasticsearch.yml"
    source = "C:/Users/carlton/Documents/TheoWAF/class7/AWS/Personal_labs/ELK_Stack/elasticsearch/config/elasticsearch.yml"
    type   = "bind"
  }

  mounts {
    target = "/usr/share/elasticsearch/config/certs"
    source = "C:/Users/carlton/Documents/TheoWAF/class7/AWS/Personal_labs/ELK_Stack/elasticsearch/config/certs"
    type   = "bind"
  }


}

