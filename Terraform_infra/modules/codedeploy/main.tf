provider "aws" {
  region = var.aws_region
}

# Define a CodeDeploy Application for ECS
resource "aws_codedeploy_app" "ecs_app" {
  name = "${var.app_name}-codedeploy-app"
  compute_platform = "ECS"
}

# Create a CodeDeploy Deployment Group for ECS
resource "aws_codedeploy_deployment_group" "ecs_deployment_group" {
  app_name              = aws_codedeploy_app.ecs_app.name
  deployment_group_name = "${var.app_name}-deployment-group"
  service_role_arn      = module.iam.codedeploy_role_arn  # Reference IAM role

  deployment_style {
    deployment_type = "BLUE_GREEN"
    deployment_option = "WITH_TRAFFIC_CONTROL"
  }

  blue_green_deployment_config {
    terminate_blue_instances_on_deployment_success {
      action = "TERMINATE"
      termination_wait_time_in_minutes = 5
    }

    deployment_ready_option {
      action_on_timeout = "CONTINUE_DEPLOYMENT"
    }
  }

  ecs_service {
    cluster_name = var.ecs_cluster_name
    service_name = var.ecs_service_name
  }

  # load_balancer_info {
  #   target_group_pair_info {
  #     prod_traffic_route {
  #       listener_arn = var.prod_listener_arn
  #     }
  #     test_traffic_route {
  #       listener_arn = var.test_listener_arn
  #     }
  #     target_group {
  #       name = var.target_group_arn
  #     }
  #   }
  # }

  load_balancer_info {
    target_group_pair_info {
      prod_traffic_route {
        listener_arns = [aws_lb_listener.http.arn]
      }
      target_group {
        prod_target_group_arn = aws_lb_target_group.my_target_group.arn
      }
    }
  }

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }
}

