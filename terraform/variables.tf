variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}

variable "cluster_name" {
  type        = string
  default     = "dev-eks-practice"
  description = "Name of the EKS cluster"
}

variable "instance_type" {
  type        = string
  default     = "t3.medium"
  description = "EC2 instance type for nodes"
}