resource "azurerm_app_service" "app" {
  app_service_plan_id = "${azurerm_app_service_plan.plan.id}"
  location = "${var.location}"
  count = "${var.count}"
  name = "app-service--${var.kind}-${count.index}"
  resource_group_name = "${var.resource_group}"

  site_config {
    linux_fx_version = "${var.kind == "Linux" ? var.linux_version: ""}"
    java_version = "1.8"
    dotnet_framework_version = "v4.0"
    always_on = true
  }

}

resource "azurerm_app_service_plan" "plan" {
  name = "appserviceplan-${var.kind}"
  location = "${var.location}"
  resource_group_name = "${var.resource_group}"
  kind = "${var.kind}"
  reserved = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}
