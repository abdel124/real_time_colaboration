provider "aws" {
  region = "us-west-2"
}

# IAM roles, CodePipeline, CodeBuild, CodeDeploy, Lambda, ECS, and S3 configurations.
module "ecs" {
  source = "./modules/ecs"
}

module "lambda" {
  source = "./lambda"
}

module "pipeline" {
  source = "./codepipeline"
}