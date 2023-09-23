output "endpoint" {
  value = aws_eks_cluster.demo.endpoint
} 

output "cluster_name" {
  value = aws_eks_cluster.demo.name
}

output  "identity"  { 
  value = aws_eks_cluster.demo.identity[0].oidc[0].issuer
}

