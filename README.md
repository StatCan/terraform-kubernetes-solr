# Terraform Kubernetes Solr Operator

## Introduction

This module deploys and configures the Solr Operator inside a Kubernetes Cluster.

* https://github.com/apache/lucene-solr-operator

## Security Controls

The following security controls can be met through configuration of this template:

* TBD

## Dependencies

* None

## Optional (depending on options configured)

* None

## Usage

```terraform

```

## Variables Values

| Name                 | Type   | Required | Value                                               |
| -------------------- | ------ | -------- | --------------------------------------------------- |
| chart_version        | string | yes      | Version of the Helm Chart                           |
| dependencies         | string | yes      | Dependency name refering to namespace module        |
| helm_namespace       | string | yes      | The namespace Helm will install the chart under     |
| helm_repository      | string | yes      | The repository where the Helm chart is stored       |
| values               | list   | no       | Values to be passed to the Helm Chart               |

## History

| Date     | Release    | Change                                                     |
| -------- | ---------- | ---------------------------------------------------------- |
| 20210220 | 20210220.1 | Initial release of Solr Operator                           |
