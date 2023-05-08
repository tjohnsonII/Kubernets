#!/bin/bash

# Set the name and namespace of your Kubernetes deployment
DEPLOYMENT_NAME=myapp
NAMESPACE=default

# Build your Docker image
docker build -t myimage:latest .

# Push the Docker image to a registry (optional)
docker push myregistry/myimage:latest

# Create or update the Kubernetes deployment
kubectl apply -f deployment.yaml -n $NAMESPACE

# Check the status of the deployment
kubectl rollout status deployment/$DEPLOYMENT_NAME -n $NAMESPACE

# Expose the deployment as a Kubernetes service
kubectl expose deployment/$DEPLOYMENT_NAME --port=80 --target-port=80 -n $NAMESPACE
