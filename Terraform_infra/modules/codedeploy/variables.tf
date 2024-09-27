variable "app_name" {
  description = "The name of the application"
  type        = string
}

variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "ecs_service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "load_balancer_name" {
  description = "The name of the load balancer"
  type        = string
}

variable "prod_listener_arn" {
  description = "The ARN of the production ALB listener"
  type        = string
}

variable "test_listener_arn" {
  description = "The ARN of the test ALB listener"
  type        = string
}

variable "target_group_arn" {
  description = "The ARN of the target group used by ECS"
  type        = string
}

variable "aws_region" {
  description = "The AWS region"
  type        = string
}
