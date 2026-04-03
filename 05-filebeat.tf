# configure filebeat container
resource "docker_container" "filebeat" {
  name  = "filebeat"
  image = docker_image.filebeat.image_id

  restart = "unless-stopped"

  networks_advanced {
    name = docker_network.elk.name
  }

  # Map host logs to continer

  mounts {
    type      = "bind"
    source    = "C:/Users/carlton/Documents/TheoWAF/class7/AWS/Personal_labs/ELK_Stack/filebeat/config/filebeat.yml"
    target    = "/usr/share/filebeat/filebeat.yml"
    read_only = true
  }

  mounts {
    type = "bind"
    source = "C:/Users/carlton/Documents/TheoWAF/class7/AWS/Personal_labs/ELK_Stack/filebeat/config/certs/"
    target = "/usr/share/filebeat/config/certs/"
  }

  mounts {
    type   = "bind"
    source = "C:/elk-logs"
    target = "/usr/share/filebeat/logs"
  }

  # Filebeat config can be mounted via a config file
  # For now, use default config pointing to localhost Elasticsearch

  env = [
    "ELASTICSEARCH_HOSTS=https://elasticsearch:9200"
  ]

  command = [
    "--strict.perms=false"
  ]

  depends_on = [
    docker_container.elasticsearch
  ]

}