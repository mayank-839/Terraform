resource "azurerm_bastion" "bstion" {

   for_each = var.bastion
   name                = each.value.name
   resource_group_name = each.value.resource_group_name
    location            = each.value.location

    
}