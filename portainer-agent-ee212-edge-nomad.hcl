variable NOMAD_ADDRESS {}
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
        EDGE = 1
        NOMAD_ADDR = var.NOMAD_ADDRESS
        NOMAD_TOKEN = var.NOMAD_TOKEN
        EDGE_ID = var.EDGE_ID
        EDGE_KEY = var.EDGE_KEY
        EDGE_INSECURE_POLL = var.EDGE_INSECURE_POLL
      }
      config {
        #image = "portainerci/agent:pr236"
        image = "portainerci/agent:pr236-linux-amd64-alpine"
        force_pull = true
      }
    }
  }
}
