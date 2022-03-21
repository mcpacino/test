variable NOMAD_TOKEN {}
variable EDGE_ID {}
variable EDGE_KEY {}
variable EDGE_INSECURE_POLL {}

job "portainer-agent" {
  datacenters = ["dc1"]

  group "portainer-agent" {
    task "portainer-agent" {
      driver = "docker"

      env = {
        NOMAD_ADDR = "http://${attr.nomad.advertise.address}"
        NOMAD_TOKEN = var.NOMAD_TOKEN
        EDGE = 1
        EDGE_KEY = var.EDGE_KEY
        EDGE_ID = var.EDGE_ID
        EDGE_INSECURE_POLL = var.EDGE_INSECURE_POLL
      }
      config {
        image = "portainerci/agent:pr275"
        #image = "portainerci/agent:pr236-linux-amd64-alpine"
        force_pull = true
      }
    }
  }
}
