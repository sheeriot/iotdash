output "linux_app_ids" {
    value = "${azurerm_linux_function_app.funcapp.identity}"
}
output "linux_app_id0" {
    value = "${azurerm_linux_function_app.funcapp.identity[0]}"
}
output "linux_app_id0_principal" {
    value = "${azurerm_linux_function_app.funcapp.identity[0].principal_id}"
}
# output "linux_app_ids_principal" {
#     value = "${azurerm_linux_function_app.funcapp.identity[0].principal_id}"
# }
output "azurerm_key_vault_secret_versionless" {
    value = "${azurerm_key_vault_secret.mtag1_reader.versionless_id}"
}
output "azurerm_key_vault_secret_resource_versionless" {
    value = "${azurerm_key_vault_secret.mtag1_reader.versionless_id}"
}