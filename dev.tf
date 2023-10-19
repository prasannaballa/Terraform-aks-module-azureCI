terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

module "dev" {
  source      = "./modules"
  ...
}
  prefix = "dev"
  resource_group_name = "aks_tf_rg"
  location            = "CentralUS"
  cluster_name        = "devakspras1769"
  kubernetes_version  = "1.26.3"
  system_node_count   = 2
  acr_name            = "myacrdev1234"            
}
