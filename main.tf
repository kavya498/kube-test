
data "ibm_container_cluster_config" "cluster_foo" {
  cluster_name_id = "test41f4"
}

provider "kubernetes" {
  load_config_file       = "false"
  host                   = data.ibm_container_cluster_config.cluster_foo.host
  token                  = data.ibm_container_cluster_config.cluster_foo.token
  cluster_ca_certificate = data.ibm_container_cluster_config.cluster_foo.ca_certificate
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "terraform-example-namespace"
  }
}
