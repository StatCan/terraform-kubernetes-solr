# Solr Operator

#####################
### Solr Operator ###
#####################

# A Release is an instance of a chart running in a Kubernetes cluster.
#
# https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release
#
resource "helm_release" "solr_operator" {
  name = "solr-operator"

  repository          = var.helm_repository
  repository_username = var.helm_repository_username
  repository_password = var.helm_repository_password

  chart     = "solr-operator"
  version   = var.helm_chart_version
  namespace = var.helm_namespace
  timeout   = 1200

  values = [<<EOF
replicaCount: 1

image:
  repository: apache/solr-operator
  tag: v0.5.1
  pullPolicy: IfNotPresent

# imagePullSecrets:
#   - name: "k8scc01covidacr-registry-connection"

nameOverride: ""
fullnameOverride: ""

zookeeper-operator:
  install: true
  crd:
    create: true

# A comma-separated list of namespaces that the operator should watch.
# If empty, the solr operator will watch all namespaces in the cluster.
watchNamespaces: ""

rbac:
  # Specifies whether RBAC resources should be created
  create: true

serviceAccount:
  # Specifies whether a ServiceAccount should be created
  create: true
  # The name of the ServiceAccount to use.
  # Required if create is false.
  # If not set and create is true, a name is generated using the fullname template
  name:

resources:
  limits:
    cpu: 400m
    memory: 500Mi
  requests:
    cpu: 100m
    memory: 100Mi

envVars: []
EOF

    , var.helm_values,
  ]
}
