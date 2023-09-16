
resource "kubernetes_service" "patriceservice" {
  
  depends_on = [kubernetes_deployment.patricedeployement ]
  metadata {
    name = "patriceservice"
    namespace = "patrice"

  }

  spec {
    selector = {
    app = "webapp"
    }
    port {
      port = 80
      target_port = 80
    }
  }

  
}

