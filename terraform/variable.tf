variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-1"
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "eks-project"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "eks-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "private_subnets" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "eks-cluster"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.28"
}

variable "worker_instance_types" {
  description = "Instance types for worker nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "worker_desired_size" {
  description = "Desired size of node group"
  type        = number
  default     = 2
}

variable "worker_min_size" {
  description = "Minimum size of node group"
  type        = number
  default     = 1
}

variable "worker_max_size" {
  description = "Maximum size of node group"
  type        = number
  default     = 3
}

variable "worker_disk_size" {
  description = "Disk size for worker nodes in GB"
  type        = number
  default     = 50
}

variable "capacity_type" {
  description = "Capacity type for the worker nodes (ON_DEMAND or SPOT)"
  type        = string
  default     = "ON_DEMAND"
}
