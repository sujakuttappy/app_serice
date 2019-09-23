provider "azurerm" {
  version = "~> 1.34"
  client_id = "${var.client_id}"
  client_secret = "${var.client_secret}"
  subscription_id = "${var.subscription_id}"
  tenant_id = "${var.tenant_id}"
  environment = "public"
}

data "azurerm_resource_group" "rg" {
  name = "${var.resource_group}"
}

module "app_service_lin" {
  source = "app_service"
  resource_group = "${var.resource_group}"
  location = "${var.location}"
  count = "${var.count}"
  kind = "Linux"
  linux_version = "${var.linux_version}"
}

module "app_service_win" {
  source = "app_service"
  resource_group = "${var.resource_group}"
  location = "${var.location}"
  count = "${var.count}"
  kind = "Windows"
  linux_version = ""
}