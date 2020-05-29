variable "bucket" {
  description = "Source bucket for event triggers"
}

variable "trigger_id" {
  description = "An identifier for the trigger"
}

variable "topics" {
  description = "A list of topic names notified by trigger events"
  type        = list(string)
  default     = []
}

variable "queues" {
  description = "A list of SQS queue names notified by trigger events"
  type        = list(string)
  default     = []
}

variable "lambda_functions" {
  description = "A list of Lambda function names notified by trigger events"
  type        = list(string)
  default     = []
}

variable "events" {
  description = "A list of S3 trigger events"
  type        = list(string)
}

variable "filter_prefix" {
  description = "Filter triggers by specific S3 object prefix"
  default     = null
}

variable "filter_suffix" {
  description = "Filter triggers by specific S3 object suffix"
  default     = null
}
