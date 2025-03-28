terraform {
  backend "s3" {
    bucket         = "your-eks-terraform-state-bucket"
    key            = "terraform/eks/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "your-eks-terraform-lock-table"
  }
}
