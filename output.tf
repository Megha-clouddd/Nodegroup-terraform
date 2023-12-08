output "aws_region_output" {
  description = "The configured AWS region"
  value       = var.aws_region
}

output "desired_capacity_output" {
  description = "The desired number of nodes in the node group"
  value       = var.desired_capacity
}

output "kubeconfig_path_output" {
  description = "The path to the kubeconfig file"
  value       = var.kubeconfig_path
}

output "awdh_name_output" {
  description = "The name of the Kubernetes node group"
  value       = var.awdh_name
}
