# Configuration
$Region = "us-east-1"
$S3Bucket = "my-terraform-aft-state"
$DynamoDBTable = "terraform-locks"

# Check if S3 bucket exists
Write-Host "Checking for S3 bucket: $S3Bucket"
try {
    aws s3api head-bucket --bucket $S3Bucket | Out-Null
    Write-Host "S3 bucket already exists."
} catch {
    Write-Host "Creating S3 bucket..."
    aws s3api create-bucket `
        --bucket $S3Bucket `
        --region $Region `
        --create-bucket-configuration LocationConstraint=$Region
    Write-Host "S3 bucket created: $S3Bucket"
}

# Check if DynamoDB table exists
Write-Host "Checking for DynamoDB table: $DynamoDBTable"
try {
    aws dynamodb describe-table --table-name $DynamoDBTable --region $Region | Out-Null
    Write-Host "DynamoDB table already exists."
} catch {
    Write-Host "Creating DynamoDB table..."
    aws dynamodb create-table `
        --table-name $DynamoDBTable `
        --attribute-definitions AttributeName=LockID,AttributeType=S `
        --key-schema AttributeName=LockID,KeyType=HASH `
        --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 `
        --region $Region
    Write-Host "DynamoDB table created: $DynamoDBTable"
}

Write-Host "Terraform backend setup complete."
