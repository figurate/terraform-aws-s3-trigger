/**
 * # ![AWS](aws-logo.png) S3 Trigger
 *
 * [![CI](https://github.com/figurate/terraform-aws-s3-trigger/actions/workflows/main.yml/badge.svg)](https://github.com/figurate/terraform-aws-s3-trigger/actions/workflows/main.yml)
 *
 *
 * Purpose: Templates for S3 object triggers.
 */
data "aws_s3_bucket" "source" {
  bucket = var.bucket
}

data "aws_sns_topic" "topics" {
  count = length(var.topics)
  name  = var.topics[count.index]
}

data "aws_sqs_queue" "queues" {
  count = length(var.queues)
  name  = var.queues[count.index]
}

data "aws_lambda_function" "lambda_functions" {
  count         = length(var.lambda_functions)
  function_name = var.lambda_functions[count.index]
}

resource "aws_s3_bucket_notification" "trigger" {
  bucket = data.aws_s3_bucket.source.id

  dynamic "topic" {
    for_each = data.aws_sns_topic.topics
    content {
      id            = var.trigger_id
      topic_arn     = topic.value.arn
      events        = var.events
      filter_prefix = var.filter_prefix
      filter_suffix = var.filter_suffix
    }
  }

  dynamic "queue" {
    for_each = data.aws_sqs_queue.queues
    content {
      id            = var.trigger_id
      queue_arn     = queue.value.arn
      events        = var.events
      filter_prefix = var.filter_prefix
      filter_suffix = var.filter_suffix
    }
  }

  dynamic "lambda_function" {
    for_each = data.aws_lambda_function.lambda_functions
    content {
      id                  = var.trigger_id
      lambda_function_arn = lambda_function.value.arn
      events              = var.events
      filter_prefix       = var.filter_prefix
      filter_suffix       = var.filter_suffix
    }
  }
}
