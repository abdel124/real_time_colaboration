output "pipeline_name" {
  description = "The name of the CodePipeline"
  value       = aws_codepipeline.ci_cd_pipeline.name
}

output "pipeline_role_arn" {
  description = "The ARN of the CodePipeline IAM Role"
  value       = aws_iam_role.codepipeline_role.arn
}