## Install ArgoCD:
-------------------
```python
$ kubectl create namespace argocd
$ kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```
### Source: https://argo-cd.readthedocs.io/en/stable/getting_started/

## Deploy Ingress-Nginx for NLB with ACM:
-----------------------------------------
1. Download the deploy.yaml template
```python
wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.2/deploy/static/provider/aws/nlb-with-tls-termination/deploy.yaml
```
2. Edit the file and change the VPC CIDR in use for the Kubernetes cluster:
```python
proxy-real-ip-cidr: XXX.XXX.XXX/XX
```
3. Change the AWS Certificate Manager (ACM) ID as well:
```python
arn:aws:acm:us-west-2:XXXXXXXX:certificate/XXXXXX-XXXXXXX-XXXXXXX-XXXXXXXX
```
4. Deploy the manifest:
```python
$ kubectl apply -f deploy.yaml
```
### Source: https://kubernetes.github.io/ingress-nginx/deploy/#aws

## Deploy ArgoCD Pod Ingress Service:
--------------------------------------
```python
$ nano ingress.yaml
```
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: argocd-server-ingress
  namespace: argocd
  annotations:
    nginx.ingress.kubernetes.io/backend-protocol: "HTTPS"
spec:
  ingressClassName: nginx
  rules:
  - host: argocd.domain.com ## specify your domain
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: argocd-server
            port:
              name: https
```
### Source: https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#private-argo-cd-ui-with-multiple-ingress-objects-and-byo-certificate

```python
$ kubectl apply -f ingress.yaml
```

```python
Create a record for the domain in AWS Route 53 with NLB endpoint
```