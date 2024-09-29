variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default     = "my-ecs-cluster"
}

variable "ecs_task_family" {
  description = "The family of the ECS task definition"
  type        = string
  default     = "my-ecs-task-family"
}

variable "ecs_service_name" {
  description = "The name of the ECS service"
  type        = string
  default     = "my-ecs-service"
}

variable "container_name" {
  description = "Name of the container in the ECS task definition"
  type        = string
  default     = "my-app-container"
}

variable "container_image" {
  description = "Container image to run in the task definition"
  type        = string
}

variable "container_port" {
  description = "Port that the container exposes"
  type        = number
  default     = 80
}

variable "ecs_desired_count" {
  description = "Desired number of running ECS tasks"
  type        = number
  default     = 2
}

variable "cpu" {
  description = "The amount of CPU for the container"
  type        = number
  default     = 256
}

variable "memory" {
  description = "The amount of memory for the container"
  type        = number
  default     = 512
}

variable "vpc_id" {
  description = "ID of the VPC where the ECS service will run"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where the ECS service will run"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for the ECS service"
  type        = string
}
