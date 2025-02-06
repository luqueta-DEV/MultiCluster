resource "kubernetes_deployment" "example" {
    metadata {
        name = "my-app"
        namespace = "my-namespace"   
    }
  
    spec {
        replicas = 3
        template {
            metadata {
                labels = {
                    app = "my-app"
                }
            }
        
        spec {
            container {
                name = "my-app"
                image = "my-app:1.0"
        }            
     }
  }
 }
}