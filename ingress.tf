resource "kubernetes_ingress_v1" "nginx" {
  metadata {
    name = "ingress-service"
    namespace = kubernetes_namespace.develop.metadata[0].name
#    annotations = {
#      "kubernetes.io/tls-acme" = "true"
#    }
  }

  spec {
    ingress_class_name = "nginx"

#    tls {
#      hosts       = ["develop.192-168-1-10.nip.io"]
#      secret_name = "tls-dbadmin"
#    }

    rule {
      host = "develop.192-168-1-10.nip.io"

      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = kubernetes_service.nginx.metadata[0].name
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
