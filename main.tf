locals {
  kubeconfig_file = "${path.module}/kubeconfig"
}

provider "local" {}

# provider "kubernetes" {
#   config_path = local.kubeconfig_file
# }

provider "kubernetes" {
  config_path = local_file.kubeconfig.filename
}

resource "local_file" "kubeconfig" {
  depends_on = [local_file.otherstuff]
  filename   = "${path.module}/kubeconfig"
  content    = file("~/.kube/config")
}

resource "local_file" "otherstuff" {
  count    = 10
  filename = "${path.module}/otherstuff.${count.index}"
  content  = file("~/.kube/config")
}

resource "kubernetes_config_map" "test" {
  depends_on = [local_file.kubeconfig]
  metadata {
    name = "test"
  }

  data = {
    "foo" = "bar"
  }
}

output "locals_kubeconfig_file" {
  value = local.kubeconfig_file
}

output "local_file_kubeconfig" {
  value = local_file.kubeconfig.filename
}