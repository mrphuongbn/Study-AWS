variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID which is provided by network team"
  type        = string
}

variable "git_pw" {
  type = string
}