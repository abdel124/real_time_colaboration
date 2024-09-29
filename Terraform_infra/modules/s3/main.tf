resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = "my-codepipeline-artifacts"
  
  tags = {
    Name = "CodePipeline Artifact Bucket"
    Environment = "dev"
  }
}

resource "aws_s3_bucket" "codebuild_bucket" {
  bucket = "my-codebuild-artifacts"
  
  tags = {
    Name = "CodeBuild Artifact Bucket"
    Environment = "dev"
  }
}

resource "aws_s3_bucket" "codedeploy_bucket" {
  bucket = "my-codedeploy-artifacts"
  
  tags = {
    Name = "CodeDeploy Artifact Bucket"
    Environment = "dev"
  }
}
