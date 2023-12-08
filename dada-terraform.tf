provider "kubernetes" {
  config_path = var.kubeconfig_path
}

resource "kubernetes_deployment" "node_group" {
  metadata {
    name = var.node_group_name
  }

  spec {
    replicas = var.desired_capacity

    selector {
      match_labels = {
        app = var.node_group_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.node_group_name
        }
      }

      spec {
        container {
          name  = var.node_group_name
          image = var.node_instance_type
        }
      }
    }
  }

  timeouts {
    create = "30m"  # Adjust this timeout value as needed
  }
}
--------------

  variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  default     = "AKIAREQZALJOQDAK6K73"
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  default     = "K5PuC/gH36E9+EmIfXtG5mab2pVs8WpvM7BoVNGV"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "kubectl_context" {
  description = "kubectl context name"
  type        = string
  default     = "kubernetes-admin@kubernetes"
}

variable "desired_capacity" {
  description = "Desired number of nodes in the node group"
  type        = number
  default     = 2
}

variable "kubeconfig_path" {
  description = "Path to the kubeconfig file"
  type        = string
  default     = "~/.kube/config"
}

variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
  default     = "newproject"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the node group"
  type        = list(string)
  default     = ["subnet-0ac728e0a60b9ed03", "subnet-0c0736ad848d83dc5", "subnet-0dd915880cd8b19da"]
}

variable "node_group_name" {
  description = "Name of the Kubernetes node group"
  type        = string
  default     = "my-node-group"
}
---------------


  # outputs.tf

output "node_group_name" {
  value = kubernetes_deployment.node_group.metadata[0].name
}

output "node_group_replicas" {
  value = kubernetes_deployment.node_group.spec[0].replicas
}
-----------------------

  

  
