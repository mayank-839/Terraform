resource "azurerm_network_security_group" "nsg" {
  for_each            = var.nsgs
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location


  security_rule {
    name                       = each.value.name1
    priority                   = each.value.priority
    direction                  = each.value.direction
    access                     = each.value.access
    protocol                   = each.value.protocol
    source_port_range          = each.value.source_port_range
    destination_port_range     = each.value.destination_port_range
    source_address_prefix      = each.value.source_address_prefix
    destination_address_prefix = each.value.destination_address_prefix
  }

  security_rule {
    name                       = each.value.name2
    priority                   = each.value.priority2
    direction                  = each.value.direction2
    access                     = each.value.access2
    protocol                   = each.value.protocol2
    source_port_range          = each.value.source_port_range2
    destination_port_range     = each.value.destination_port_range2
    source_address_prefix      = each.value.source_address_prefix2
    destination_address_prefix = each.value.destination_address_prefix2
  }
}
data "azurerm_network_interface" "nic" {
  for_each            = var.nsgs
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_network_interface_security_group_association" "nsg_association" {
  for_each            = var.nsg_associations
  network_interface_id = data.azurerm_network_interface.nic[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}