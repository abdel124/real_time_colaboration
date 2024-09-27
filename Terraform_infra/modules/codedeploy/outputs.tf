output "codedeploy_role_arn" {
  description = "ARN of the IAM role for CodeDeploy"
  value       = aws_iam_role.codedeploy_role.arn
}
