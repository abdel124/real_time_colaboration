variable "app_name" {
  description = "The name of the application"
  type        = string
}

variable "pipeline_role_name" {
  description = "Name of the role for CodePipeline"
  type        = string
  default     = "codepipeline-role"
}

variable "codebuild_role_name" {
  description = "Name of the role for CodeBuild"
  type        = string
  default     = "codebuild-role"
}

variable "ecs_task_execution_role_name" {
  description = "The name of the role for ECS task execution"
  type        = string
  default     = "ecs-task-execution-role"
}
