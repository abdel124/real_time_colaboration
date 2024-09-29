provider "aws" {
  region = "us-west-2"
}

# IAM roles, CodePipeline, CodeBuild, CodeDeploy, Lambda, ECS, and S3 configurations.
module "ecs" {
  source = "./modules/ecs"
}

module "ecr" {
  source = "./modules/ecr"
}

module "ecs" {
  source = "./modules/ecs"
}

module "build" {
  source = "./modules/codebuild"
}

module "deploy" {
  source = "./modules/codedeploy"
}

module "artifact" {
  source = "./modules/codeartifact"
}