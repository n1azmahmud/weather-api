variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets where the node group will be created"
  type        = list(string)
}

variable "node_role_arn" {
  description = "IAM Role ARN for the nodes in the node group"
  type        = string
}

variable "instance_types" {
  description = "List of EC2 instance types for the node group"
  type        = list(string)
  default     = ["t2.micro"]
}

variable "desired_size" {
  description = "Desired number of nodes in the node group"
  type        = number
  default     = 1
}

variable "min_size" {
  description = "Minimum number of nodes in the node group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of nodes in the node group"
  type        = number
  default     = 2
}
