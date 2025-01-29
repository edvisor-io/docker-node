#!/bin/bash

# Variables
AWS_PROFILE="prodAdmin"
ECR_REGISTRY="483222395173.dkr.ecr.us-west-2.amazonaws.com"

# Function to copy image with error handling
copy_image() {
    local source=$1
    local target=$2
    local repo_name=$3

    echo "Ensuring repository ${repo_name} exists..."
    if ! AWS_PROFILE=$AWS_PROFILE aws ecr describe-repositories --repository-names "${repo_name}" 2>/dev/null; then
        echo "Creating repository ${repo_name}..."
        if AWS_PROFILE=$AWS_PROFILE aws ecr create-repository --repository-name "${repo_name}"; then
            echo "✅ Repository ${repo_name} created"
        else
            echo "❌ Failed to create repository ${repo_name}"
            ERRORS=$((ERRORS + 1))
            return 1
        fi
    fi

    echo "Copying $source to $target..."
    if AWS_PROFILE=$AWS_PROFILE crane copy $source $target; then
        echo "✅ Successfully copied $source"
    else
        echo "❌ Failed to copy $source"
        exit 1
    fi
}

echo "Starting image copy process..."

# Node 12.21.0
copy_image "edvisorio/node:12.21.0" "${ECR_REGISTRY}/node:12.21.0" "node"
copy_image "edvisorio/node:12.21.0-build" "${ECR_REGISTRY}/node:12.21.0-build" "node"

# Node 12.8.1
copy_image "edvisorio/node:12.8.1" "${ECR_REGISTRY}/node:12.8.1" "node"
copy_image "edvisorio/node:12.8.1-build" "${ECR_REGISTRY}/node:12.8.1-build" "node"

# Node 14.16.0
copy_image "edvisorio/node:14.16.0" "${ECR_REGISTRY}/node:14.16.0" "node"
copy_image "edvisorio/node:14.16.0-build" "${ECR_REGISTRY}/node:14.16.0-build" "node"

# Node 8
copy_image "edvisor/node:8" "${ECR_REGISTRY}/node:8" "node"
copy_image "edvisor/node:8-build" "${ECR_REGISTRY}/node:8-build" "node"
copy_image "edvisor/node:latest" "${ECR_REGISTRY}/node:8-latest" "node"

# Nginx
copy_image "edvisor/nginx:latest" "${ECR_REGISTRY}/nginx:latest" "nginx"


copy_image "edvisor/build:5" "${ECR_REGISTRY}/build:5" "build"
copy_image "edvisor/build:6" "${ECR_REGISTRY}/build:6" "build"
copy_image "edvisor/build:latest" "${ECR_REGISTRY}/build:latest" "build"

#copy_image "edvisor/passenger:latest" "${ECR_REGISTRY}/passenger:latest" "passenger"

copy_image "edvisor/nginx-node:latest" "${ECR_REGISTRY}/nginx-node:latest" "nginx-node"

copy_image "edvisor/elasticsearch:latest" "${ECR_REGISTRY}/elasticsearch:latest" "elasticsearch"

copy_image "edvisor/logspout-papertrail:latest" "${ECR_REGISTRY}/logspout-papertrail:latest" "logspout-papertrail"

echo "All images copied successfully!"
