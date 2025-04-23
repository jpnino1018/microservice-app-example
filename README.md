# Microservice App - PRFT Devops Training

## Components
In each folder you can find a more in-depth explanation of each component:

1. [Users API](/users-api) is a Spring Boot application. Provides user profiles. At the moment, does not provide full CRUD, just getting a single user and all users.
2. [Auth API](/auth-api) is a Go application, and provides authorization functionality. Generates [JWT](https://jwt.io/) tokens to be used with other APIs.
3. [TODOs API](/todos-api) is a NodeJS application, provides CRUD functionality over user's TODO records. Also, it logs "create" and "delete" operations to [Redis](https://redis.io/) queue.
4. [Log Message Processor](/log-message-processor) is a queue processor written in Python. Its purpose is to read messages from a Redis queue and print them to standard output.
5. [Frontend](/frontend) Vue application, provides UI.

## 🏗️ Infrastructure Provisioning

### Tools Used:
- **Terraform**: For provisioning infrastructure
- **Azure CLI**: For additional role assignments

### Provisioned Resources:
- **AKS Cluster**: Azure Kubernetes Service to run the microservices
- **ACR (Azure Container Registry)**: Stores Docker images used by the microservices
- **Redis Cache**: Used by the `log-message-processor` service
- **API Management**: Allows us to manage all our APIs from a single place

---

## 🐳 Docker Images

Each microservice was containerized using a `Dockerfile`. Images were pushed to ACR after building.

---

## ✨ Deployed Microservices

### ✅ Front-End
- Built and deployed as a React app served via NGINX.
- Exposed using a Kubernetes `Service` (type: LoadBalancer).

### ✅ Todos API
- Node.js REST API.
- Exposed via Kubernetes.
- Connected to Redis (host provided via environment variable).

### ✅ Log Message Processor
- Python microservice consuming Redis pub/sub.
- Deployed with Redis channel and host set via environment variables.

### ✅ Users API
- Java Spring Boot app.
- Required `JWT_SECRET` and `SERVER_PORT` as environment variables.

### ✅ Auth API
- Golang service using `go mod`.
- Requires `JWT_SECRET`, `AUTH_API_PORT`, and `USERS_API_ADDRESS`.

---

## ⚙️ Redis Setup

- A Redis resource was provisioned using Terraform.
- Credentials and connection string were pulled from the Azure Portal.
- Set `REDIS_HOST`, `REDIS_PORT`, and `REDIS_CHANNEL` as environment variables in Kubernetes.

---

## 🔧 Kubernetes Deployments

Each service had a dedicated:
- **Deployment** YML
- Docker image pulled from ACR

---

## Automatization

### GitHub Actions
- Implemented CI/CD pipelines for automated deployment.
- On every push to the main branches (master and develop), a GitHub Actions workflow triggers:
  - Builds the Docker image.
  - Pushes it to Azure Container Registry (ACR).
  - Applies the latest Kubernetes deployment.
- If changes on the infrastructure are detected, a special pipeline will trigger validating and applying only those changes based on Terraform format
- Ensures continuous delivery of all microservices after changes.
- Secrets used for the workflow are stored in the GitHub repo settings (such as `AZURE_CREDENTIALS` and various relevant Azure-related variables).




