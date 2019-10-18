# Terraform Kubernetes Solr

## Introduction

This module deploys and configures Solr Cloud inside a Kubernetes Cluster.

## Security Controls

The following security controls can be met through configuration of this template:

* TBD

## Dependencies

* None

## Usage

```terraform
module "helm_solr" {
  source = "github.com/canada-ca-terraform-modules/terraform-kubernetes-solr?ref=20191018.1"

  chart_version = "0.1.0"
  dependencies = [
    "${module.namespace_default.depended_on}",
  ]

  helm_service_account = "tiller"
  helm_namespace = "solr"
  helm_repository = "solr"

  values = <<EOF
image:
  repository: solr
  tag: 7.6.0
  pullPolicy: IfNotPresent
  # Add the secret name to pull from a private registry.
  pullSecret:
    - name: artifactory-prod

podAnnotations:
  sidecar.istio.io/inject: 'false'

zookeeper:
  podAnnotations:
    sidecar.istio.io/inject: 'false'

ingress:
  enabled: true
  annotations:
    kubernetes.io/ingress.class: istio
  hosts:
    - solr.${var.ingress_domain}
  tls:

destinationRule:
  enabled: true

EOF
}
```

## Variables Values

| Name                 | Type   | Required | Value                                               |
| -------------------- | ------ | -------- | --------------------------------------------------- |
| chart_version        | string | yes      | Version of the Helm Chart                           |
| dependencies         | string | yes      | Dependency name refering to namespace module        |
| helm_service_account | string | yes      | The service account for Helm to use                 |
| helm_namespace       | string | yes      | The namespace Helm will install the chart under     |
| helm_repository      | string | yes      | The repository where the Helm chart is stored       |
| values               | list   | no       | Values to be passed to the Helm Chart               |

## History

| Date     | Release    | Change      |
| -------- | ---------- | ----------- |
| 20191018 | 20191018.1 | 1st release |
