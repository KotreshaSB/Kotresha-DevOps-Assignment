output "cluster_id" {
  value = aws_eks_cluster.kotresha.id
}

output "node_group_id" {
  value = aws_eks_node_group.kotresha.id
}

output "vpc_id" {
  value = aws_vpc.kotresha_vpc.id
}

output "subnet_ids" {
  value = aws_subnet.kotresha_subnet[*].id
}
