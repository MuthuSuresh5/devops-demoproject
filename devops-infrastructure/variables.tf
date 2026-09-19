variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "availability_zones" {
  description = "Availability Zones"
  type        = list(string)
}

variable "public_subnets" {
  description = "Public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private subnet CIDRs"
  type        = list(string)
}

variable "eks_node_instance_types" {
  description = "EKS worker node instance types"
  type        = list(string)
}

variable "eks_desired_nodes" {
  description = "Desired number of EKS nodes"
  type        = number
}

variable "eks_min_nodes" {
  description = "Minimum number of EKS nodes"
  type        = number
}

variable "eks_max_nodes" {
  description = "Maximum number of EKS nodes"
  type        = number
}