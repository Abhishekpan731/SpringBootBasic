#!/bin/bash

# Namespace
NAMESPACE="mynamespace"
DEPLOYMENT_NAME="springbootbasic-deployment"
SERVICE_NAME="springbootbasic-service"
IMAGE_NAME="abhishekbit96/springbootbasic:latest"

echo "🚀 Starting Kubernetes Deployment Debugging..."

# Step 1: List Docker images
echo "📌 Listing Docker Images..."
docker images

# Step 2: Push Docker image
echo "📌 Pushing Docker Image to Repository..."
docker push $IMAGE_NAME

# Step 3: Apply Kubernetes Namespace
echo "📌 Applying Namespace..."
kubectl apply -f namespace.yaml

# Step 4: Apply Deployments and Services
echo "📌 Deploying Spring Boot Application..."
kubectl apply -f k8s/deployment.yaml
echo "📌 Deploying Redis..."
kubectl apply -f k8s/redis.yaml

# Step 5: Wait and Check Deployment Status
echo "⏳ Waiting for pods to start..."
sleep 10

echo "📌 Checking Deployments..."
kubectl get deployments -n $NAMESPACE

echo "📌 Checking Pods..."
kubectl get pods -n $NAMESPACE

# Step 6: Describe Deployment for Debugging
echo "📌 Describing Deployment..."
kubectl describe deployment $DEPLOYMENT_NAME -n $NAMESPACE

# Step 7: Get Logs of Failing Pods
echo "📌 Fetching Logs of Failing Pods..."
for pod in $(kubectl get pods -n $NAMESPACE --no-headers | grep $DEPLOYMENT_NAME | awk '{print $1}'); do
    echo "📌 Logs for pod: $pod"
    kubectl logs $pod -n $NAMESPACE
done

# Step 8: Check Events in Namespace
echo "📌 Checking Kubernetes Events..."
kubectl get events -n $NAMESPACE --sort-by=.metadata.creationTimestamp

# Step 9: Restart Deployment
echo "📌 Restarting Deployment..."
kubectl rollout restart deployment $DEPLOYMENT_NAME -n $NAMESPACE

# Step 10: Check Service Status
echo "📌 Checking Service Details..."
kubectl get services -n $NAMESPACE

# Step 11: Test Application Health (If exposed)
echo "📌 Checking Application Health..."
curl -I http://localhost:1996/actuator/health

echo "✅ Debugging Completed!"
