variable "cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
}

variable "cluster_role_arn" {
  description = "The ARN of the IAM role that the EKS cluster will use."
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs where the EKS cluster will be created."
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID where the EKS cluster will be created."
  type        = string
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster."
  type        = string
  default     = "1.21"
}
