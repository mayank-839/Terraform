module "rg" {
  rg     = var.rg
  source = "../../child_module/Resource_group"
}

module "vnet" {
  vnet       = var.vnet
  source     = "../../child_module/vnet"
  depends_on = [module.rg]
}

module "subnet" {
  subnets    = var.subnet
  source     = "../../child_module/subnet"
  depends_on = [module.vnet]
}

module "pip" {
  pip        = var.pip
  source     = "../../child_module/pip"
  depends_on = [module.rg]
}

module "nic" {
  nic        = var.nic
  source     = "../../child_module/nic"
  depends_on = [module.subnet, module.pip]
}

# module "nsg" {
#   nsgs             = var.nsg
#   nsg_associations = var.nsg_associations
#   source           = "../../child_module/nsg"
#   depends_on       = [module.nic]
# }
module "vm" {
  vms        = var.vm
  source     = "../../child_module/vm"
  depends_on = [module.nic]
}