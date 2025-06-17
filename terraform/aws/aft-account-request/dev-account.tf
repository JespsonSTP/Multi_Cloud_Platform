resource "aws_aft_account_request" "dev_account" {
  
  control_tower_parameters = {
    AccountEmail              = "jespstpierre+dev@gmail.com"
    AccountName               = "Development"  # More descriptive than "dev-account"
    ManagedOrganizationalUnit = "Dev"  # Change this to match your existing OU
    SSOUserEmail              = "jespstpierre+dev@gmail.com"
    SSOUserFirstName          = "Dev"
    SSOUserLastName           = "Admin"
  }
  
  account_tags = {
    Environment = "Development"
    Purpose     = "Application Development"
    Owner       = "Jespson"
  }
  
  change_management_parameters = {
    change_requested_by = "Jespson"
    change_reason       = "Creating development account"  # Fixed from "staging"
  }
  
  account_customizations_name = "aft-default"
}