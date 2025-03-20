resource "kubernetes_service" "nginx" {
  metadata {
    name = "nginx-service"
    namespace = kubernetes_namespace.develop.metadata[0].name
    labels = {
      app = "nginx"
    }
  }

  spec {
    selector = {
      app = "nginx"
    }

    port {
      port        = 80
      target_port = 80
      name        = "http-port"
    }

    type = "ClusterIP"
  }
}

