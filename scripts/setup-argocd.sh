#!/bin/bash

# setup-argocd.sh - Automated ArgoCD installation and configuration

set -o errexit
set -o nounset
set -o pipefail

# Check for kubectl
if ! command -v kubectl &> /dev/null; then
    echo "Error: kubectl not found. Please install it first."
    exit 1
fi

# Create argocd namespace if not exists
if ! kubectl get namespace argocd &> /dev/null; then
    kubectl create namespace argocd
    echo "Created namespace: argocd"
fi

# Install ArgoCD
echo "Installing ArgoCD..."
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Wait for pods to be ready
echo "Waiting for ArgoCD pods to be ready..."
kubectl wait --for=condition=available --timeout=300s -n argocd deployment/argocd-server
kubectl wait --for=condition=ready --timeout=300s -n argocd pod -l app.kubernetes.io/name=argocd-server

# Patch to LoadBalancer
echo "Configuring LoadBalancer service..."
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

# Get credentials
ARGOCD_SERVER=$(kubectl get svc argocd-server -n argocd -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
ARGOCD_PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

# Create Application resources
echo "Creating ArgoCD Applications..."
kubectl apply -f ../argocd/application.yaml

# Output access information
cat <<EOF

ArgoCD Setup Complete!
=====================

Dashboard URL: http://$ARGOCD_SERVER
Username: admin
Password: $ARGOCD_PASSWORD

You can also access via port-forward:
  kubectl port-forward svc/argocd-server -n argocd 8080:443

Login with:
  argocd login $ARGOCD_SERVER --username admin --password $ARGOCD_PASSWORD --insecure

EOF