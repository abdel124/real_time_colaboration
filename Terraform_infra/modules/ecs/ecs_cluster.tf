resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.app_name}-cluster"
}

resource "aws_ecs_service" "product_image_service" {
  name            = "product-image-processor"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  desired_count   = 1
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = aws_lb_target_group.main.arn
    container_name   = "product-image-container"
    container_port   = 8080
  }

  deployment_controller {
    type = "CODE_DEPLOY"
  }

  task_definition = aws_ecs_task_definition.product_image_task_def.arn

  depends_on = [aws_lb_listener.main]
}
