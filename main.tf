module "vpc" {
  source = "./modules/vpc"

  name            = var.vpc_name
  cidr            = var.vpc_cidr
  azs             = var.availability_zones
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  
  enable_nat_gateway   = true
  single_nat_gateway   = var.environment == "dev" ? true : false
  enable_dns_hostnames = true
  
  # EKS-specific tags for subnet discovery
  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = 1
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = 1
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}

module "eks" {
  source = "./modules/eks"

  cluster_name    = var.cluster_name
  cluster_version = var.kubernetes_version
  
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  
  # Node groups configuration
  node_groups = {
    main = {
      name           = "main"
      instance_types = var.worker_instance_types
      desired_size   = var.worker_desired_size
      min_size       = var.worker_min_size
      max_size       = var.worker_max_size
      capacity_type  = var.capacity_type
      disk_size      = var.worker_disk_size
    }
  }
  
  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}
