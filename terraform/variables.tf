variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "appscrip-devops-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.27"
}

variable "vpc_id" {
  description = "VPC ID where EKS will be deployed"
  type        = string
  default     = "" # Leave empty to create new VPC
}

variable "subnets" {
  description = "List of subnet IDs"
  type        = list(string)
  default     = [] # Leave empty to create new subnets
}