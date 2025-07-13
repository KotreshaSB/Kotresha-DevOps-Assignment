# Kotresha-DevOps-Assignment
Create a complete CI/CD infrastructure pipeline on AWS using Terraform, Kubernetes, ArgoCD, and optionally, Ingress + DNS.

DevOps Assignment – Appscrip Interview

This repository contains an end-to-end CI/CD pipeline for deploying a static website using Terraform, AWS EKS, ArgoCD, NGINX, Ingress, and GoDaddy DNS.

Domain: https://www.devopskotresha.live


This repository contains a complete CI/CD infrastructure on AWS using Terraform, EKS, Kubernetes, ArgoCD, and Ingress with DNS.

1. Steps to Provision the Cluster (Using Terraform)
   Clone the Repository
   git clone https://github.com/KotreshaSB/Kotresha-DevOps-Assignment.git               
   cd Kotresha-DevOps-Assignment/terraform
   Initialize Terraform terraform init
   Preview Infrastructure Plan terraform plan
   Apply the Infrastructure
   Update Kubeconfig
   aws eks --region ap-south-1 update-kubeconfig --name appscrip-eks

2. Deploy NGINX App Using ArgoCD
    Install ArgoCD on the EKS Cluster kubectl create namespace argocd
    kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
    Expose ArgoCD Server (Using LoadBalancer)
    kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}' kubectl get svc -n argocd
    ArgoCD Login Instructions
    Get ArgoCD Admin Password:
    kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d
   
3. Access ArgoCD UI:
    URL: http://<ARGOCD-LOADBALANCER-IP>
    Username: admin
    Password: (from above command)
4. Create ArgoCD Application
   Public Access URL for NGINX
   Static HTML NGINX Website

5. URL: https://www.devopskotresha.live
    Ingress + Domain Details
    Ingress controller: NGINX
    DNS provider: GoDaddy
    Record type: CNAME
    - Value: a7ea2299758584722b6dd1a53184ed2e-682a0496d228ab90.elb.ap-south-1.amazonaws.com
Useful Links
GitHub: https://github.com/KotreshaSB/Kotresha-DevOps-Assignment

Website: https://www.devopskotresha.live

Summary
This assignment demonstrates:
AWS EKS provisioning with Terraform
Kubernetes manifests for NGINX app
GitOps CI/CD pipeline using ArgoCD

