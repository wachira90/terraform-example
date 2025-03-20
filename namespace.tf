resource "kubernetes_namespace" "develop" {
  metadata {
    name = "develop"
  }
}
