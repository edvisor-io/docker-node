#!/bin/bash

# Set your AWS account ID and region
AWS_ACCOUNT_ID="395768714932"
AWS_REGION="us-east-1"
ECR_REGISTRY="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"

# Create ECR repositories if they don't exist
echo "Creating ECR repositories..."

# Create repository for node-12.21.0
#aws ecr describe-repositories --repository-names node-12.21.0 2>/dev/null || \
#aws ecr create-repository --repository-name node-12.21.0

# Create repository for node-12.21.0-build
#aws ecr describe-repositories --repository-names node-12.21.0-build 2>/dev/null || \
#aws ecr create-repository --repository-name node-12.21.0-build

# Login to ECR
echo "Logging in to ECR..."
aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_REGISTRY}

# Build and push the base image (12.21.0)
echo "Building and pushing base image..."
cd 12.21.0
docker build -t node-12.21.0 .
docker tag node-12.21.0:latest ${ECR_REGISTRY}/node-12.21.0:latest
docker push ${ECR_REGISTRY}/node-12.21.0:latest

# Update the FROM line in the build Dockerfile
echo "Updating build Dockerfile..."
sed -i "s|FROM edvisorio/node:12.21.0|FROM ${ECR_REGISTRY}/node-12.21.0:latest|" ../12.21.0-build/Dockerfile

# Build and push the build image (12.21.0-build)
echo "Building and pushing build image..."
cd ../12.21.0-build
docker build -t node-12.21.0-build .
docker tag node-12.21.0-build:latest ${ECR_REGISTRY}/node-12.21.0-build:latest
docker push ${ECR_REGISTRY}/node-12.21.0-build:latest

echo "Done!"
