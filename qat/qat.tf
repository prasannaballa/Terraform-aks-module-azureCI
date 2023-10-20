terraform {
  backend "azurerm" {
    resource_group_name = "aks"
    storage_account_name = "qatmoduleci"
    container_name = "qatmoduletest"
    key = "terraform.storage"
    access_key = "f1ToTn9/do5vjriQGQZwhSFn+vTXuIwK/+m2ZTPd7aVCOdr9fmTuPH5WiB0hE5emurpM1vwEsY2O+AStXOPVcQ=="
  }
}
module "qat" {
  source      = "../module"
  prefix = "qat"
  resource_group_name = "aksqattest"
  location            = "CentralUS"
  cluster_name        = "qataksprastest0769"
  kubernetes_version  = "1.26.3"
  system_node_count   = 2
  acr_name            = "myacrqattest1234"            
}
