variable "cluster_name" {
  description = "The name of the cluster."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "The CIDR block range for the public subnets."
  type        = string
  default     = "10.0.0.0/18"
}

variable "az_count" {
  description = "The number of availability zones to use for subnets."
  type        = number
  default     = 2
}