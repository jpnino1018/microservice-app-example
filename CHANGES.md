# Main changes so far...
- Specified a terraform infrastructure supported by Azure Cloud services **Patterns applied are CACHE-ASIDE and API GATEWAY (so far...)**.
- Dockerfiles were created for each microservice in order to add their respective image into ACR. Run the following commands MANUALLY (for now) inside their respective folder to create and push images into ACR. Change `FOLDER NAME` to the respective folder name (duh).
- - `docker build -t acrformymicroservices.azurecr.io/<FOLDER NAME>:latest .`
  - `docker push acrformymicroservices.azurecr.io/<FOLDER NAME>:latest`
- .yml files were created for each microservice in order to specify variables and run containers using Kubernetes cluster (AKS). Run the following commands MANUALLY (for now) inside their respective folder to create and push PODS into the cluster. Change `FOLDER NAME` to the respective folder name (duh).
- - `kubectl apply -f <FOLDER NAME>-deployment.yml`

# Trouble so far...
- While running the infrastructure for the first time ACR and AKS are NOT connected. In fewer words, access to AKS must be MANUALLY granted to ACR. This is the command to fo it:
  - `az aks update -n <your-aks-cluster-name> -g <your-resource-group> --attach-acr <your-acr-name>`
  
    **THIS SHOULD BE AUTOMATED**

- **auth-api** couldn't be tested locally because an error with dependencies. The image couldn't be loaded into the cloud so the Dockerfile MUST be modified to comply with project requirements and copy the packages provided by the base repository (Gopkg).

# Next steps...
- Use github secrets or some kind of environment variable manager in order to make our code dynamic (Everything is hardcoded right now).
- Automate deployment using Github Actions or Jenkins

# Things I just don't know...
- How to manage a branching strategy (check rubric).
- Is there even a dev team? Is it one of us?

 
