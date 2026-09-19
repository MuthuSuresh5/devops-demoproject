module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  # Use cluster_name instead of name
  cluster_name    = "${var.project_name}-eks"
  
  # Explicitly set cluster version to fix the "Invalid count argument" error
  cluster_version = "1.30"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  endpoint_public_access                   = true
  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    devops_nodes = {
      name           = "${var.project_name}-nodes"
      instance_types = var.eks_node_instance_types
      capacity_type  = "ON_DEMAND"

      min_size     = var.eks_min_nodes
      max_size     = var.eks_max_nodes
      desired_size = var.eks_desired_nodes
    }
  }

  tags = {
    Project     = var.project_name
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}