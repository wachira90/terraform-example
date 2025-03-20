resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "deploy-nginx"
    namespace = kubernetes_namespace.develop.metadata[0].name
    labels = {
      app = "nginx"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "public.ecr.aws/nginx/nginx:1.27.0"

          port {
            container_port = 80
            name           = "http-port"
          }

          resources {
            limits = {
              cpu    = "500m"
              memory = "128Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "64Mi"
            }
          }
        }
      }
    }
  }
}

