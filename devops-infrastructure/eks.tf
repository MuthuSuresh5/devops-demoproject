module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name = "${var.project_name}-eks"

  vpc_id = module.vpc.vpc_id

  subnet_ids = module.vpc.private_subnets

  endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    devops_nodes = {

      name = "${var.project_name}-nodes"

      instance_types = var.eks_node_instance_types

      capacity_type = "ON_DEMAND"

      min_size = var.eks_min_nodes

      max_size = var.eks_max_nodes

      desired_size = var.eks_desired_nodes
    }
  }

  tags = {
    Project     = var.project_name
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}