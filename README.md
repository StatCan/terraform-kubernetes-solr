# Terraform Kubernetes Solr Operator

## Introduction

This module deploys and configures the Solr Operator inside a Kubernetes Cluster.

- https://github.com/apache/lucene-solr-operator

## Security Controls

The following security controls can be met through configuration of this template:

- TBD

## Dependencies

- None

# Providers

| Name       | Version |
| ---------- | ------- |
| helm       | `2.4.1` |
| kubernetes | `3.1.1` |

# Modules

No Modules.

# Resources

| Name                                                                                                 |
| ---------------------------------------------------------------------------------------------------- |
| [helm_release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) |

# Inputs

| Name                     | Type   | Required | Value                                                         |
| ------------------------ | ------ | -------- | ------------------------------------------------------------- |
| helm_chart_version       | string | yes      | Version of the Helm Chart                                     |
| helm_namespace           | string | yes      | The namespace Helm will install the chart under               |
| helm_repository          | string | yes      | The repository where the Helm chart is stored                 |
| helm_repository_username | string | no       | The username of the repository where the Helm chart is stored |
| helm_repository_password | string | no       | The password of the repository where the Helm chart is stored |
| helm_release_name        | string | no       | The release name                                              |
| helm_chart               | string | no       | The name of the chart to use                                  |
| helm_values              | string | no       | Values to be passed to the Helm Chart                         |

# Outputs

| Name           | Description              |
| -------------- | ------------------------ |
| helm_namespace | Namespace of the release |

## History

| Date     | Release | Change                                 |
| -------- | ------- | -------------------------------------- |
| 20230203 | v4.0.1  | Specify sensitive variables            |
| 20220908 | v4.0.0  | Align with upstream helm chart changes |
| 20210826 | v3.0.0  | Update module for Terraform 0.13       |
