output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "The endpoint for the EKS cluster"
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "The CA certificate data for the EKS cluster"
  value       = module.eks.cluster_certificate_authority_data
  sensitive   = true
}

output "kubeconfig" {
  description = "kubectl config file contents for the EKS cluster"
  value       = module.eks.kubeconfig
  sensitive   = true
}

output "argocd_server_url" {
  description = "URL for ArgoCD server after it's deployed"
  value       = "https://${module.eks.cluster_endpoint}/argocd"
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.eks.vpc_id
}

output "subnet_ids" {
  description = "List of subnet IDs created for EKS"
  value       = module.eks.subnet_ids
}