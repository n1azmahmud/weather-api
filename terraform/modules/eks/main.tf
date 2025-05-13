resource "aws_eks_cluster" "this" {
  name     = "weather-api"
  role_arn = "arn:aws:iam::816881851211:role/EKSClusterRole"  # Use the existing role ARN

  version  = "1.29"

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  tags = {
    Name = "weather-api"
  }
}

resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_role_arn   = "arn:aws:iam::816881851211:role/EKSNodeGroupRole"  # Use the existing role ARN
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 2
  }

  instance_types  = ["t3.micro"]  # Use a free tier eligible instance

  tags = {
    Name = "weather-api-node-group"
  }
}
