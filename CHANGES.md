# Main changes so far

- A **Terraform** infrastructure supported by Azure Cloud services has been specified.
    
    The patterns implemented at this point are:
    - **CACHE-ASIDE**
    - **API GATEWAY**

- Dockerfiles were created for each microservice in order to add their respective images to the **_Azure Container Registtr (ACR)_**. 
    
    To build and upload the images, the following commands must be executed (manually for the moment) inside the corresponding directory (replace `<FOLDER_NAME>` with the actual name of the microservice):

    ```bash
    docker build -t acrformymicroservices-test.azurecr.io/<FOLDER NAME>:latest .

    docker push acrformymicroservices-test.azurecr.io/<FOLDER NAME>:latest
    ```

- .yml files were created for each microservice in order to specify variables and run containers using Kubernetes cluster (AKS). 

    To to create and push the PODS into the cluster, run the following commands (manually for the moment) inside the corresponding directory (replace `<FOLDER_NAME>` with the actual name of the microservice):

    ```bash
    kubectl apply -f <FOLDER NAME>-deployment.yml
    ```

---

## Trouble so far

**_I THINK I FIXED THIS BUT HAVENT TESTED IT_**

- When running the infrastructure for the first time, ACR and AKS are not automatically connected.  
    
    It is necesary to manually grant access to the AKS cluster so that you can extract images from ACR. This is done with the following command:

    ```bash
    az aks update -n <your-aks-cluster-name> -g <your-resource-group> --attach-acr <your-acr-name>
    ```

    >**Note:** THIS SHOULD BE AUTOMATED

---

## Next steps

- Incorporate some kind of variable management system (such as GitHub Secrets) in order to make our code dynamic (everything is hardcoded right now).

- Automate the build and deployment process using tools such as GitHub Actions or Jenkins.

---

## Things we just don't know

- How to manage a branching strategy (check rubric).
- Is there even a dev team? Is it one of us?
- Everything is being launched into cloud services using personal (student) account. Is this proper? 


> **IMPORTANT NOTE:** Change the `subscription_id` in [variables.tf](terraform/variables.tf) to your own for the structure to build.
