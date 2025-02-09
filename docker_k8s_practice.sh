#!/bin/bash

echo "🚀 Starting Docker & Kubernetes Practice Commands..."

# =========================== #
#       DOCKER COMMANDS       #
# =========================== #

echo "📌 Docker Basics"

# 1. Check Docker version
docker --version

# 2. List all Docker images
docker images

# 3. List running containers
docker ps

# 4. List all containers (including stopped)
docker ps -a

# 5. Pull an official image
docker pull nginx:latest

# 6. Run a container in detached mode
docker run -d --name my-nginx -p 8080:80 nginx

# 7. Check container logs
docker logs my-nginx

# 8. Stop a running container
docker stop my-nginx

# 9. Start a stopped container
docker start my-nginx

# 10. Restart a container
docker restart my-nginx

# 11. Remove a container
docker rm my-nginx

# 12. Remove an image
docker rmi nginx:latest

# 13. Run a container interactively
docker run -it ubuntu bash

# 14. Execute a command in a running container
docker exec -it my-nginx bash

# 15. List all Docker networks
docker network ls

# 16. Inspect a Docker network
docker network inspect bridge

# 17. Create a custom Docker network
docker network create my_network

# 18. Remove a Docker network
docker network rm my_network

# 19. Build a Docker image from Dockerfile
docker build -t my_app .

# 20. Tag a Docker image
docker tag my_app myrepo/my_app:v1

# 21. Push image to Docker Hub
docker push myrepo/my_app:v1

# 22. Remove all stopped containers
docker container prune -f

# 23. Remove all unused images
docker image prune -a -f

# 24. Check system-wide Docker info
docker info

# 25. Get container stats
docker stats --no-stream

# ============================ #
#      DOCKER COMPOSE          #
# ============================ #

echo "📌 Docker Compose"

# 26. Start services using Docker Compose
docker-compose up -d

# 27. Stop services
docker-compose down

# 28. Restart services
docker-compose restart

# 29. View logs of a service
docker-compose logs -f

# 30. Build and start containers
docker-compose up --build -d

# 31. List services
docker-compose ps

# 32. Stop a single service
docker-compose stop web

# 33. Start a single service
docker-compose start web

# =========================== #
#      KUBERNETES COMMANDS    #
# =========================== #

echo "📌 Kubernetes Basics"

# 34. Check Kubernetes version
kubectl version --client

# 35. List all namespaces
kubectl get namespaces

# 36. Create a namespace
kubectl create namespace mynamespace

# 37. Get all pods in a namespace
kubectl get pods -n mynamespace

# 38. Get detailed info about a pod
kubectl describe pod mypod -n mynamespace

# 39. Delete a pod
kubectl delete pod mypod -n mynamespace

# 40. Apply a deployment
kubectl apply -f k8s/deployment.yaml

# 41. Get all deployments
kubectl get deployments -n mynamespace

# 42. Get details of a deployment
kubectl describe deployment mydeployment -n mynamespace

# 43. Restart a deployment
kubectl rollout restart deployment mydeployment -n mynamespace

# 44. Scale deployment to 3 replicas
kubectl scale deployment mydeployment --replicas=3 -n mynamespace

# 45. Get all services
kubectl get services -n mynamespace

# 46. Get service details
kubectl describe service myservice -n mynamespace

# 47. Expose deployment as a service
kubectl expose deployment mydeployment --type=NodePort --port=8080 -n mynamespace

# 48. Get nodes in the cluster
kubectl get nodes

# 49. Get events in the cluster
kubectl get events --sort-by=.metadata.creationTimestamp

# 50. Apply a ConfigMap
kubectl apply -f k8s/configmap.yaml

# 51. Get all ConfigMaps
kubectl get configmaps -n mynamespace

# 52. Get ConfigMap details
kubectl describe configmap myconfigmap -n mynamespace

# 53. Delete a ConfigMap
kubectl delete configmap myconfigmap -n mynamespace

# 54. Apply a Secret
kubectl apply -f k8s/secret.yaml

# 55. Get all Secrets
kubectl get secrets -n mynamespace

# 56. Get Secret details
kubectl describe secret mysecret -n mynamespace

# 57. Delete a Secret
kubectl delete secret mysecret -n mynamespace

# 58. Port-forward a service
kubectl port-forward svc/myservice 8080:80 -n mynamespace

# 59. Run a pod
kubectl run mypod --image=nginx --restart=Never -n mynamespace

# 60. Get all persistent volume claims
kubectl get pvc -n mynamespace

# 61. Get persistent volumes
kubectl get pv

# 62. Delete a persistent volume claim
kubectl delete pvc mypvc -n mynamespace

# 63. Get all Ingress resources
kubectl get ingress -n mynamespace

# 64. Apply an Ingress resource
kubectl apply -f k8s/ingress.yaml

# 65. Describe an Ingress resource
kubectl describe ingress myingress -n mynamespace

# 66. Delete an Ingress resource
kubectl delete ingress myingress -n mynamespace

# 67. Get logs of a running pod
kubectl logs mypod -n mynamespace

# 68. Stream logs from a pod
kubectl logs -f mypod -n mynamespace

# 69. Get all role-based access control (RBAC) roles
kubectl get roles -n mynamespace

# 70. Get all RoleBindings
kubectl get rolebindings -n mynamespace

# 71. Apply an RBAC role
kubectl apply -f k8s/rbac.yaml

# 72. Delete an RBAC role
kubectl delete role myrole -n mynamespace

# 73. Delete an RBAC rolebinding
kubectl delete rolebinding myrolebinding -n mynamespace

# 74. Get all CronJobs
kubectl get cronjobs -n mynamespace

# 75. Apply a CronJob
kubectl apply -f k8s/cronjob.yaml

# 76. Delete a CronJob
kubectl delete cronjob mycronjob -n mynamespace

echo "✅ Docker & Kubernetes Practice Completed!"
