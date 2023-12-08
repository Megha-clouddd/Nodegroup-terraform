provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.eks_cluster_name
  cluster_version = "1.21"
  subnet_ids      = [var.subnet_id]
  vpc_id          = "vpc-02177ac02304102bc"

}

module "eks_node_group" {
  source = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"

  cluster_name     = module.eks_cluster.cluster_name
  subnet_ids       = [var.subnet_id]
  node_group_name  = "eks_nodes"
  desired_size     = 2
  max_size         = 3
  min_size         = 1
  key_name         = "dada.pem"
  instance_types   = "t2.small"

}
---------------

variable "aws_access_key" {
  description = "AWS access key"
}

variable "aws_secret_key" {
  description = "AWS secret key"
}

variable "aws_region" {output "eks_cluster_endpoint" {
  description = "The endpoint URL for the EKS cluster"
  value       = module.eks.cluster_endpoint
}

output "eks_node_group_details" {
  description = "Details of the EKS node group"
  value       = module.eks.node_group["eks_nodes"]
}


  description = "AWS region"
  default     = "ap-south-1"
}

variable "eks_cluster_name" {
  description = "EKS cluster name"
  default     = "DHC-AW-EKS"

---------------


}
-------------------

aws_access_key = "AKIAREQZALJOQDAK6K73"
aws_secret_key = "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"
subnet_id      = "subnet-0ac728e0a60b9ed03"

-------------------



