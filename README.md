# EKS-TF-Bitbucket-Pipeline-ArgoCD-GitOps
A Repo Which Consist Code For EKS TF Infra, Bitbucket Pipeline With Docker &amp; ArgoCD GitOps With EKS Addons

## Blog Link:
https://towardsaws.com/cicd-deploy-to-aws-eks-terraform-with-bitbucket-pipeline-argocd-gitops-7172ffffc630

# In case you wanna have Multi-AZ (Keep desired_size = 2 minm) (In base/deploy.yaml)
```
replicas: 2
template:
  spec:
    nodeSelector:
      eks.amazonaws.com/nodegroup: your-nodegroup-label
    containers:
      - name: your-container-name
        image: your-ecr-url/your-image-name:image-tag
```
> Remember to keep the replicas to even number so that app will be distributed evenly.

# To Run Specific Commands After Pod Runs Succesfully (In base/deploy.yaml)
```
containers:
  - name: your-app
    lifecycle:
       postStart:
         exec:
           command: ["/usr/local/bin/node", "services/executeMe.js"]
```
> This will execute the command on every pod launch.
