# creating docker network 
resource "docker_network" "elk" {
  name = "elk-network"
}



# creating data persistence
resource "docker_volume" "elasticsearch_data" {
  name = "elasticsearch-data"
}

# creating data persistence kibana
resource "docker_volume" "kibana-data" {
  name = "kibana_data"
}


# imgae pull of elsaticsearch
resource "docker_image" "elasticsearch" {
  name         = "docker.elastic.co/elasticsearch/elasticsearch:8.19.13"
  keep_locally = true

}

# image pull of kibana 
resource "docker_image" "kibana" {
  name         = "docker.elastic.co/kibana/kibana:8.19.13"
  keep_locally = true

}

# imaage pull of flilebeat
resource "docker_image" "filebeat" {
  name         = "docker.elastic.co/beats/filebeat:8.19.13"
  keep_locally = true

}



