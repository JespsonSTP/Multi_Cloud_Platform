#!/bin/bash

# Configurable variables
REGION="us-east-1"
S3_BUCKET="my-terraform-aft-state"
DYNAMODB_TABLE="terraform-locks"

echo "Checking for S3 bucket: $S3_BUCKET"

# Check if S3 bucket exists
if aws s3api head-bucket --bucket "$S3_BUCKET" 2>/dev/null; then
  echo "S3 bucket already exists."
else
  echo "Creating S3 bucket..."
  aws s3api create-bucket \
    --bucket "$S3_BUCKET" \
    --region "$REGION" \
    --create-bucket-configuration LocationConstraint="$REGION"
  echo "S3 bucket created: $S3_BUCKET"
fi

echo "Checking for DynamoDB table: $DYNAMODB_TABLE"

# Check if DynamoDB table exists
if aws dynamodb describe-table --table-name "$DYNAMODB_TABLE" --region "$REGION" 2>/dev/null; then
  echo "DynamoDB table already exists."
else
  echo "Creating DynamoDB table..."
  aws dynamodb create-table \
    --table-name "$DYNAMODB_TABLE" \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --region "$REGION"
  echo "DynamoDB table created: $DYNAMODB_TABLE"
fi

echo "Backend setup complete."
