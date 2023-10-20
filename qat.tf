terraform {
  backend "azurerm" {
    resource_group_name = "Terraform"
    storage_account_name = "mytfstorage12345"
    container_name = "terraformqat"
    key = "terraform.storage"
    access_key = "k+m0krF3hiuX9TSshFHlrttm/2r9Ne58J8U6aPNHVlaAEp/48YuYGvhI19Y2ixdU0/AYZsYhih70+AStinPztQ=="
  }
}
module "qat" {
  source      = "./module"
  prefix = "qat"
  resource_group_name = "aksqat"
  location            = "CentralUS"
  cluster_name        = "qatakspras0769"
  kubernetes_version  = "1.26.3"
  system_node_count   = 2
  acr_name            = "myacrqat1234"            
}
