# EKS-TF-Bitbucket-Pipeline-ArgoCD-GitOps
A Repo Which Consist Code For EKS TF Infra, Bitbucket Pipeline With Docker &amp; ArgoCD GitOps With EKS Addons

## Blog Link:
https://towardsaws.com/cicd-deploy-to-aws-eks-terraform-with-bitbucket-pipeline-argocd-gitops-7172ffffc630

# In case you wanna have Multi-AZ (Keep desired_size = 2 minm)
```
replicas: 2
template:
  spec:
    nodeSelector:
      eks.amazonaws.com/nodegroup: your-updated-nodegroup-label
    containers:
      - name: your-updated-container-name
        image: your-ecr-url/your-updated-image-name:your-tag
```
> Remember to keep the replicas to even number so that app will be distributed evenly.
