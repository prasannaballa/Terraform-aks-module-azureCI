terraform {
  backend "azurerm" {
    resource_group_name = "Terraform"
    storage_account_name = "mytfstorage12345"
    container_name = "terraformsf"
    key = "terraform.vmstorage"
    access_key = "k+m0krF3hiuX9TSshFHlrttm/2r9Ne58J8U6aPNHVlaAEp/48YuYGvhI19Y2ixdU0/AYZsYhih70+AStinPztQ=="
  }
}
module "dev" {
  source      = "./modules"
  resource_group_name = "aks_tf_rg"
  location            = "CentralUS"
  cluster_name        = "devakspras1769"
  kubernetes_version  = "1.26.3"
  system_node_count   = 2
  acr_name            = "myacrdev1234"            
}
