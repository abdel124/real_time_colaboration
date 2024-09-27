output "ecs_service_url" {
  value = aws_ecs_service.product_image_service.load_balancer[0].dns_name
}

output "lambda_function_arn" {
  value = aws_lambda_function.inventory_lambda.arn
}