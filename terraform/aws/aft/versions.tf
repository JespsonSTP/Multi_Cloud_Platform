terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }
  backend "s3" {
    bucket = "{{CT-MANAGEMENT-ACCOUNT}}-aftbootstrap-tfstate"
    key    = "state/terraform.tfstate"
    region = "{{CT-HOME-REGION}}"
    dynamodb_table = "ddb-aftbootstrap-state"
  }
}
