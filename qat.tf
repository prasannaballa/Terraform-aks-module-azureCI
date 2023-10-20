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
