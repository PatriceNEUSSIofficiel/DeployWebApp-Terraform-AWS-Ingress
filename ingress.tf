provider "kubernetes" {
  config_path =  "~/.kube/config"
}

provider "aws" {

    access_key = ""
    secret_key = ""
    region = ""
  
}

resource "aws_route53_record" "dns_record" {
    zone_id = ""
    name = ""
    type = "A"
    ttl = 300
    records = [""]
  
}


resource "kubernetes_ingress_v1" "patriceingress" {

    metadata {
      name = "patriceingress"
      namespace = "patrice"

      annotations = {
        
        "nginx.ingress.kubernetes.io/rewrite-target" = "/$1"
        "kubernetes.io/ingress.class" = "nginx"
      }
    }
    spec {
      ingress_class_name = "nginx"
      rule {
        host = "patrice-neussi.itengineeringpro.fr"
        http {
         path {
           path = "/(.*)"
           backend {
             service {
               name = kubernetes_service.patriceservice.metadata[0].name
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


resource "kubernetes_deployment" "patricedeployement" {

    metadata {
      name = "patricedeployement"
      namespace = "patrice"

    }

    spec {
      replicas = 3

    selector {
      match_labels ={
        app = "webapp"
      } 
    }

    template {
        
      metadata {
        labels = {
          app = "webapp"
        }
      }

      spec {
        container {
          name = "patricecontainer"
          image = "patricehub/my_porfulio_image"


        port{
            container_port = 80
        }
        }
        
      }
    }
    }

}