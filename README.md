# ![AWS](aws-logo.png) S3 Trigger

[![CI](https://github.com/figurate/terraform-aws-s3-trigger/actions/workflows/main.yml/badge.svg)](https://github.com/figurate/terraform-aws-s3-trigger/actions/workflows/main.yml)

Purpose: Templates for S3 object triggers.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket | Source bucket for event triggers | `any` | n/a | yes |
| events | A list of S3 trigger events | `list(string)` | n/a | yes |
| filter\_prefix | Filter triggers by specific S3 object prefix | `any` | `null` | no |
| filter\_suffix | Filter triggers by specific S3 object suffix | `any` | `null` | no |
| lambda\_functions | A list of Lambda function names notified by trigger events | `list(string)` | `[]` | no |
| queues | A list of SQS queue names notified by trigger events | `list(string)` | `[]` | no |
| topics | A list of topic names notified by trigger events | `list(string)` | `[]` | no |
| trigger\_id | An identifier for the trigger | `any` | n/a | yes |

## Outputs

No output.

