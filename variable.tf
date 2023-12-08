variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "desired_capacity" {
  description = "Desired number of nodes in the node group"
  type        = number
  default     = 3
}

variable "kubeconfig_path" {
  description = "Path to the kubeconfig file"
  type        = string
  default     = "~/.kube/config"
}

variable "awdh_name" {
  description = "Name of the Kubernetes node group"
  type        = string
  default     = "awdh"
}
