resource "aws_codeartifact_domain" "my_codeartifact_domain" {
  domain = "my-artifact-domain"
  
  tags = {
    Name = "CodeArtifact Domain"
    Environment = "dev"
  }
}

resource "aws_codeartifact_repository" "my_codeartifact_repo" {
  repository = "my-codeartifact-repo"
  domain     = aws_codeartifact_domain.my_codeartifact_domain.domain
  
  external_connections = ["public:npmjs"]

  tags = {
    Name = "CodeArtifact Repository"
    Environment = "dev"
  }
}
