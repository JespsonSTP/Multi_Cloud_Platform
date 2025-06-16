terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "foodies-orgunits-tfstate"     
    key            = "terraform.tfstate"
    region         = "us-east-2"                  
    dynamodb_table = "foodies-orgunits-stateprod"            
    encrypt        = true
  }
}

provider "aws" {
  region 	= "us-east-2"
}


data "aws_organizations_organization" "org" {}

resource "aws_organizations_organizational_unit" "prod" {
  name      = "Prod"
  parent_id = data.aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "dev" {
  name      = "Dev"
  parent_id = data.aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "nonprod" {
  name      = "NonProd"
  parent_id = data.aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "staging" {
  name      = "Staging"
  parent_id = aws_organizations_organizational_unit.nonprod.id

  depends_on = [ aws_organizations_organizational_unit.nonprod ]
  
}

resource "aws_organizations_organizational_unit" "uat" {
  name      = "UAT"
  parent_id = aws_organizations_organizational_unit.nonprod.id

  depends_on = [ aws_organizations_organizational_unit.nonprod ]
}
