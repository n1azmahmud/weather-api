module "vpc" {
  source = "./modules/vpc"
  cluster_name = var.cluster_name
}

<<<<<<< HEAD
module "nodegroup" {
  source          = "./modules/nodegroup"
  cluster_name    = var.cluster_name
  subnet_ids      = module.vpc.subnet_ids
  node_role_arn   = "arn:aws:iam::816881851211:user/niaz_iam"
  instance_types  = ["t2.micro"]  
  desired_size    = 1
  min_size        = 1
  max_size        = 2
}

module "eks" {
  source          = "./modules/eks"
  cluster_name    = var.cluster_name
  cluster_role_arn = "arn:aws:iam::816881851211:user/niaz_iam"  
  subnet_ids      = module.vpc.subnet_ids
  vpc_id          = module.vpc.vpc_id
  cluster_version = "1.21"
}

=======
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
>>>>>>> 90f2a1e6c62ad0a5d7e99690f3ef9992bab49d95
