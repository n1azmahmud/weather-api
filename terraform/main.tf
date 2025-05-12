module "vpc" {
  source = "./modules/vpc"
  cluster_name = var.cluster_name
}

module "eks" {
  source       = "./modules/eks"
  cluster_name = var.cluster_name
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.subnet_ids
}

module "nodegroup" {
  source         = "./modules/nodegroup"
  cluster_name   = var.cluster_name
  subnet_ids     = module.vpc.subnet_ids
  node_role_arn  = module.eks.node_role_arn
}