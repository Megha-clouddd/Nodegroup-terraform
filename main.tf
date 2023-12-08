provider "aws" {
  region = var.aws_region
}

provider "kubernetes" {
  config_path = var.kubeconfig_path
}

resource "kubernetes_deployment" "awdh_name" {
  metadata {
    name = var.awdh_name
  }

  spec {
    replicas = var.desired_capacity

    selector {
      match_labels = {
        "app" = var.awdh_name
      }
    }

    template {
      metadata {
        labels = {
          "app" = var.awdh_name
        }
      }

      spec {
        container {
          name  = var.awdh_name
          image = "jenkins/jenkins:lts"  # You can change this to your desired container image
        }
      }
    }

    progress_deadline_seconds = 900  # set to a value that allows sufficient time
  }
}
