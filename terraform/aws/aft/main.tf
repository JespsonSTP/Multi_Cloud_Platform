terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "foodies-aftbootstrap-tfstateprod"     
    key            = "terraform.tfstate"
    region         = "us-east-2"                  
    dynamodb_table = "foodies-aftbootstrap-stateprod"            
    encrypt        = true
  }
}

provider "aws" {
  region 	= "us-east-2"
}

module "aft-pipeline" {
  source = "github.com/aws-ia/terraform-aws-control_tower_account_factory"

  # AFT Management Account ID (your management account)
  aft_management_account_id = "309114413271"
  
  # Control Tower Home Region
  ct_home_region = "us-east-2"
  
  # Control Tower Management Account ID (same as AFT management in your case)
  ct_management_account_id = "309114413271"
  
  # Log Archive Account ID from Control Tower
  log_archive_account_id = "445894898194"
  
  # Audit Account ID from Control Tower  
  audit_account_id = "489836962439"
  

  # VCS Configuration - all pointing to your single repo
  vcs_provider = "github"  # or "gitlab", "bitbucket", etc.
  account_request_repo_name = "JespsonSTP/Multi_Cloud_Platform"
  account_request_repo_branch = "aft-account-management"
  
  # These lines are crucial - they tell AFT to use branches instead of separate repos
  global_customizations_repo_name = "JespsonSTP/Multi_Cloud_Platform"
  global_customizations_repo_branch = "aft-global-customizations"
  
  account_customizations_repo_name = "JespsonSTP/Multi_Cloud_Platform"
  account_customizations_repo_branch = "aft-account-customizations"
  
  account_provisioning_customizations_repo_name = "JespsonSTP/Multi_Cloud_Platform"
  account_provisioning_customizations_repo_branch = "aft-account-provisioning-customizations"



  # AFT Feature flags
  aft_feature_cloudtrail_data_events               = false
  aft_feature_enterprise_support                   = false
  aft_feature_delete_default_vpcs_enabled          = true

  # AFT Additional Configurations
  aft_enable_vpc                                   = false
  backup_recovery_point_retention                  = 1
  log_archive_bucket_object_expiration_days        = 1
}
