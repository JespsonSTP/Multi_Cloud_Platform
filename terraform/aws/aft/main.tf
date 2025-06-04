provider "aws" {
  region 	= "{{CT-HOME-REGION}}"
  shared_config_files = ["%USERPROFILE%/.aws/config"]
  profile = "{{NAME-OF-THE-MNG-PROFILE}}"
}

module "aft_pipeline" {
  source = "github.com/aws-ia/terraform-aws-control_tower_account_factory"
  # Required Variables
  ct_management_account_id                         = "{{CT-MANAGEMENT-ACCOUNT}}"
  log_archive_account_id                           = "{{LOG-ARCHIVE-ACCOUNT}}"
  audit_account_id                                 = "{{AUDIT-ACCOUNT}}"
  aft_management_account_id                        = "{{AFT-MANAGEMENT-ACCOUNT}}"
  ct_home_region                                   = "{{CT-HOME-REGION}}"
  tf_backend_secondary_region                      = "{{CHOOSE-2ND-BACKUP-REGION}}"
  
  # Terraform variables
  terraform_version                                = "1.6.0"
  terraform_distribution                           = "oss"
    
  # VCS Vars
  vcs_provider                                     = "github"
  account_request_repo_name                        = "{{Org}}/aft-account-request"
  global_customizations_repo_name                  = "{{Org}}/aft-global-customizations"
  account_customizations_repo_name                 = "{{Org}}/aft-account-customizations"
  account_provisioning_customizations_repo_name    = "{{Org}}/aft-account-provisioning-customizations"

  # AFT Feature flags
  aft_feature_cloudtrail_data_events               = false
  aft_feature_enterprise_support                   = false
  aft_feature_delete_default_vpcs_enabled          = true

  # AFT Additional Configurations
  aft_enable_vpc                                   = false
  backup_recovery_point_retention                  = 1
  log_archive_bucket_object_expiration_days        = 1
}