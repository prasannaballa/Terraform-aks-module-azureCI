terraform {
  backend "azurerm" {
    resource_group_name = "Terraform"
    storage_account_name = "mytfstorage12345"
    container_name = "terraformsf"
    key = "terraform.vmstorage"
    access_key = "k+m0krF3hiuX9TSshFHlrttm/2r9Ne58J8U6aPNHVlaAEp/48YuYGvhI19Y2ixdU0/AYZsYhih70+AStinPztQ=="
  }
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}
provider "azurerm" {
    features {
      
    }

    subscription_id = "e91b7229-3664-4497-abb3-ad35e96b0d77"
    client_id = "f4bffb76-fb3d-42fa-9874-ebdbb4e49526"
    tenant_id = "48303f89-d7d2-41b5-8ae7-e81df895bdb4"
    client_secret = "_uA8Q~iwIbPpY560hDwbwuhWpg4MQHjHaHZ44bBr"  
}
resource "azurerm_resource_group" "aks-rg" {
  name     = ${var.prefix}-aks-rg
  location = var.location
}

resource "azurerm_role_assignment" "role_acrpull" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity.0.object_id
  skip_service_principal_aad_check = true
}

resource "azurerm_container_registry" "acr" {
  name                = ${var.prefix}-acr
  resource_group_name = azurerm_resource_group.aks-rg.name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = false
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = ${var.prefix}-aks
  kubernetes_version  = var.kubernetes_version
  location            = var.location
  resource_group_name = azurerm_resource_group.aks-rg.name
  dns_prefix          = var.cluster_name

  default_node_pool {
    name                = "system"
    node_count          = var.system_node_count
    vm_size             = "Standard_DS2_v2"
    type                = "VirtualMachineScaleSets"
    enable_auto_scaling = false
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet" 
  }
}