resource "aws_ecr_repository" "financial_api" {

  name = "financial-api"

  image_scanning_configuration {
    scan_on_push = true
  }

  image_tag_mutability = "IMMUTABLE"

}
