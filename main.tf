resource "null_resource" "zookeeper_operator" {
  triggers = {
    hash = filesha256("${path.module}/config/zk-operator.yaml")
  }

  provisioner "local-exec" {
    command = "kubectl -n ${var.kubectl_namespace} apply -f ${"${path.module}/config/zk-operator.yaml"}"
  }
}

resource "helm_release" "solr_operator" {
  name = "solr-operator"

  repository          = var.helm_repository
  repository_username = var.helm_repository_username
  repository_password = var.helm_repository_password

  chart     = "solr-operator"
  version   = var.chart_version
  namespace = var.helm_namespace
  timeout   = 1200

  values = [
    var.values,
  ]
}
