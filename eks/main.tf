resource "aws_iam_role" "demo" {
  name = "eks-cluster-demo"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "demo-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.demo.name
}

resource "aws_eks_cluster" "demo" {
  name = "stademo"
  role_arn = aws_iam_role.demo.arn

  # security_groups  = [var.app_server_security_group_id]
  vpc_config {
    subnet_ids  = [var.private_app_subnet_az1_id, var.private_app_subnet_az2_id]
  }


  depends_on = [aws_iam_role_policy_attachment.demo-AmazonEKSClusterPolicy]
}

/* locals {
  k8s_cluster_name = "stademo"
}

data "aws_aws_eks_cluster" "target" {
  name = local.k8s_cluster_name
}

data "aws_eks_cluster_auth" "aws_iam_authenticator" {
  name = data.aws_eks_cluster.target.name
}
 */