resource "aws_codepipeline" "ci_cd_pipeline" {
  name     = "${var.app_name}-pipeline"
  role_arn = module.iam.codepipeline_role_arn

  artifact_store {
    type     = "S3"
    location = aws_s3_bucket.pipeline_artifact_bucket.bucket
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        Owner      = var.github_owner
        Repo       = var.github_repo
        Branch     = var.github_branch
        OAuthToken = var.github_token
      }
    }
  }
  stage {
    name = "Build"
    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]

      configuration = {
        ProjectName = aws_codebuild_project.my_build.name
      }
    }
  }
  stage {
    name = "Deploy"
    action {
      name             = "Deploy"
      category         = "Deploy"
      owner            = "AWS"
      provider         = "CodeDeploy"
      version          = "1"
      input_artifacts  = ["build_output"]

      configuration = {
        ApplicationName     = aws_codedeploy_app.ecs_app.name
        DeploymentGroupName = aws_codedeploy_deployment_group.ecs_deployment_group.name
      }
    }
  }
}
