resource "aws_codebuild_project" "my_build" {
  name          = "${var.app_name}-build"
  description   = "Build project for the ${var.app_name}"
  service_role  = var.service_role_arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = var.codebuild_compute_type
    image                       = var.codebuild_image
    type                        = "LINUX_CONTAINER"
    environment_variable {
      name  = "AWS_REGION"
      value = var.aws_region
    }

    # Additional environment variables from the map
    dynamic "environment_variable" {
      for_each = var.environment_variables
      content {
        name  = environment_variable.key
        value = environment_variable.value
      }
    }
  }

  source {
    type            = var.source_type
    buildspec       = var.buildspec_file
  }

  tags = {
    Name = "${var.app_name}-build"
  }
}
