variable "app_name" {
  description = "The name of the application"
  type        = string
}

variable "codebuild_compute_type" {
  description = "The compute resources for CodeBuild"
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
}

variable "codebuild_image" {
  description = "The Docker image to use for CodeBuild"
  type        = string
  default     = "aws/codebuild/standard:5.0"
}

variable "buildspec_file" {
  description = "The location of the buildspec.yml file"
  type        = string
  default     = "buildspec.yml"
}

variable "environment_variables" {
  description = "The environment variables to pass into CodeBuild"
  type        = map(string)
  default     = {}
}

variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-1"
}

variable "service_role_arn" {
  description = "The ARN of the IAM role for CodeBuild"
  type        = string
}

variable "source_type" {
  description = "The type of source for CodeBuild"
  type        = string
  default     = "CODEPIPELINE"
}
