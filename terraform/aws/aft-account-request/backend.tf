terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "foodies-aftaccountrequest-tfstate"     
    key            = "terraform.tfstate"
    region         = "us-east-2"                  
    dynamodb_table = "foodies-aftaccountrequest-stateprod"            
    encrypt        = true
  }
}

provider "aws" {
  region 	= "us-east-2"
}
