rg = {
  rg1 = {
    name     = "rg-mayank"
    location = "central india"

  }
}

vnet = {
  vnet1 = {
    name                = "vnet-mayank"
    resource_group_name = "rg-mayank"
    location            = "central india"
    address_space       = ["10.0.0.0/16"]
  }
}

subnet = {
  subnet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "rg-mayank"
    virtual_network_name = "vnet-mayank"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "rg-mayank"
    virtual_network_name = "vnet-mayank"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

pip = {
  pip1 = {
    name                = "frontend-pip"
    resource_group_name = "rg-mayank"
    location            = "central india"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "backend-pip"
    resource_group_name = "rg-mayank"
    location            = "central india"
    allocation_method   = "Static"
  }
}

nic = {
  nic1 = {
    nic_name                          = "frontend-nic"
    resource_group_name           = "rg-mayank"
    location                      = "central india"
    ip_config_name                = "frontend-ipconfig"
    subnet_name                   = "frontend-subnet"
    private_ip_address_allocation = "Dynamic"
    pip_name                      = "frontend-pip"
    virtual_network_name          = "vnet-mayank"
  }
  nic2 = {
    nic_name                          = "backend-nic"
    resource_group_name           = "rg-mayank"
    location                      = "central india"
    ip_config_name                = "backend-ipconfig"
    subnet_name                   = "backend-subnet"
    private_ip_address_allocation = "Dynamic"
    pip_name                      = "backend-pip"
    virtual_network_name          = "vnet-mayank"
  }
}


# nsg = {
#   nsg1 = {
#     name                = "frontend-nsg"
#     resource_group_name = "rg-mayank"
#     location            = "central india"

#     name1                      = "ssh"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "22"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

#   nsg2 = {
#     name                = "backend-nsg"
#     resource_group_name = "rg-mayank"
#     location            = "central india"

#     name2                       = "ssh"
#     priority2                   = 100
#     direction2                  = "Inbound"
#     access2                     = "Allow"
#     protocol2                   = "Tcp"
#     source_port_range2          = "*"
#     destination_port_range2     = "22"
#     source_address_prefix2      = "*"
#     destination_address_prefix2 = "*"
#   }
# }

# nsg_associations = {
#   nsg1 = {
#     nic_name = "frontend-nic"

#   }
#   nsg2 = {
#     nic_name = "backend-nic"

#   }
# }

vm = {
  vm1 = {
    name                            = "frontend-vm"
    resource_group_name             = "rg-mayank"
    location                        = "central india"
    nic_name                        = "frontend-nic"
    vm_size                         = "Standard_B2as_v2"
    publisher                       = "Canonical"
    offer                           = "UbuntuServer"
    sku                             = "18.04-LTS"
    version                         = "latest"
    os_disk_name                    = "frontend-os-disk"
    caching                         = "ReadWrite"
    create_option                   = "FromImage"
    managed_disk_type               = "Standard_LRS"
    computer_name                   = "frontend-vm"
    admin_username                  = "azureuser"
    admin_password                  = "P@ssw0rd1234!"
    disable_password_authentication = false
  }
  vm2 = {
    name                            = "backend-vm"
    resource_group_name             = "rg-mayank"
    location                        = "central india"
    nic_name                        = "backend-nic"
    vm_size                         = "Standard_B2as_v2"
    publisher                       = "Canonical"
    offer                           = "UbuntuServer"
    sku                             = "18.04-LTS"
    version                         = "latest"
    os_disk_name                    = "backend-os-disk"
    caching                         = "ReadWrite"
    create_option                   = "FromImage"
    managed_disk_type               = "Standard_LRS"
    computer_name                   = "backend-vm"
    admin_username                  = "azureuser"
    admin_password                  = "P@ssw0rd1234!"
    disable_password_authentication = false
  }
}


