output "endpoint" {
  value = aws_eks_cluster.demo.endpoint
} 

output "cluster_name" {
  value = aws_eks_cluster.demo.name
}
