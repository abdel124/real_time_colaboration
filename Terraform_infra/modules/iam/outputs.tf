output "codepipeline_role_arn" {
  description = "ARN of the CodePipeline IAM role"
  value       = aws_iam_role.codepipeline_role.arn
}

output "codebuild_role_arn" {
  description = "ARN of the CodeBuild IAM role"
  value       = aws_iam_role.codebuild_role.arn
}

output "ecs_task_execution_role_arn" {
  description = "ARN of the ECS Task Execution role"
  value       = aws_iam_role.ecs_task_execution_role.arn
}
