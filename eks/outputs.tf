output "endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "c_name" {
  value = aws_eks_cluster.eks_cluster.c_name
}
