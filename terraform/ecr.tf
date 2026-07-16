resource "aws_ecr_repository" "financial_api" {

  name = "financial-api"

  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {

    scan_on_push = true

  }

  tags = {

    Project = var.project_name

  }

}

