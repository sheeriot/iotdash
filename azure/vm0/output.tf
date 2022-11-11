output "surveyor_ipaddress" {
    value = azurerm_public_ip.surveyor.ip_address
}
output "surveyor_fqdn" {
    value = azurerm_public_ip.surveyor.fqdn
}