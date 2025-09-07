# HR Vnet
#---------------------------------------------------------------------------------------------------------------#

# Creating HR Vnet                  

resource "azurerm_virtual_network" "hr_vnet" {
  name                = var.hr_vnet_name
  resource_group_name = var.resource_group_name
  location            = var.region
  address_space       = var.hr_vnet_address_space

}

# Bastion Subnet

resource "azurerm_subnet" "hr_bas_sub" {
  name                 = var.hr_bas_sub_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.hr_vnet.name
  address_prefixes     = var.hr_bas_sub_address_prefixes

}

# HR Subnet

resource "azurerm_subnet" "hr_sub" {
  name                 = var.hr_sub_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.hr_vnet.name
  address_prefixes     = var.hr_sub_address_prefixes

}

# NSG with rules

# Bastion Subnet
resource "azurerm_network_security_group" "hr_bas_nsg" {
  name                = var.hr_bas_nsg_name
  resource_group_name = var.resource_group_name
  location            = var.region
}

resource "azurerm_network_security_rule" "allow_https_in" {
  name                        = var.bas_nsg_rule01_name
  resource_group_name         = var.resource_group_name
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  access                      = "Allow"
  priority                    = "120"
  direction                   = "Inbound"
  network_security_group_name = azurerm_network_security_group.hr_bas_nsg.name
}

resource "azurerm_network_security_rule" "allow_gatewaymanager_in" {
  name                        = var.bas_nsg_rule02_name
  resource_group_name         = var.resource_group_name
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "GatewayManager"
  destination_address_prefix  = "*"
  access                      = "Allow"
  priority                    = "130"
  direction                   = "Inbound"
  network_security_group_name = azurerm_network_security_group.hr_bas_nsg.name
}

resource "azurerm_network_security_rule" "allow_azure_lb_in" {
  name                        = var.bas_nsg_rule04_name
  resource_group_name         = var.resource_group_name
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = "*"
  access                      = "Allow"
  priority                    = "140"
  direction                   = "Inbound"
  network_security_group_name = azurerm_network_security_group.hr_bas_nsg.name
}

resource "azurerm_network_security_rule" "allow_internal_in" {
  name                        = var.bas_nsg_rule03_name
  resource_group_name         = var.resource_group_name
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["8080", "5701"]
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  access                      = "Allow"
  priority                    = "150"
  direction                   = "Inbound"
  network_security_group_name = azurerm_network_security_group.hr_bas_nsg.name
}

resource "azurerm_network_security_rule" "allow_rdp_ssh_out" {
  name                        = var.bas_nsg_rule05_name
  resource_group_name         = var.resource_group_name
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["3389", "22"]
  source_address_prefix       = "*"
  destination_address_prefix  = "VirtualNetwork"
  access                      = "Allow"
  priority                    = "100"
  direction                   = "Outbound"
  network_security_group_name = azurerm_network_security_group.hr_bas_nsg.name
}

resource "azurerm_network_security_rule" "allow_azure_services_out" {
  name                        = var.bas_nsg_rule07_name
  resource_group_name         = var.resource_group_name
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "AzureCloud"
  access                      = "Allow"
  priority                    = "110"
  direction                   = "Outbound"
  network_security_group_name = azurerm_network_security_group.hr_bas_nsg.name
}

resource "azurerm_network_security_rule" "allow_internal_out" {
  name                        = var.bas_nsg_rule06_name
  resource_group_name         = var.resource_group_name
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["8080", "5701"]
  source_address_prefix       = "*"
  destination_address_prefix  = "VirtualNetwork"
  access                      = "Allow"
  priority                    = "120"
  direction                   = "Outbound"
  network_security_group_name = azurerm_network_security_group.hr_bas_nsg.name
}

resource "azurerm_network_security_rule" "allow_internet_out" {
  name                        = var.bas_nsg_rule08_name
  resource_group_name         = var.resource_group_name
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "Internet"
  access                      = "Allow"
  priority                    = "130"
  direction                   = "Outbound"
  network_security_group_name = azurerm_network_security_group.hr_bas_nsg.name
}

# HR Subnet
resource "azurerm_network_security_group" "hr_nsg" {
  name                = var.hr_nsg_name
  resource_group_name = var.resource_group_name
  location            = var.region
}

resource "azurerm_network_security_rule" "hr_nsg_rule" {
  name                        = var.hr_nsg_rule_name
  resource_group_name         = var.resource_group_name
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  access                      = "Deny"
  priority                    = "100"
  direction                   = "Inbound"
  network_security_group_name = azurerm_network_security_group.hr_nsg.name
}

# NSG with rules

# Associates a NSG

# with HR Bastion Subnet
resource "azurerm_subnet_network_security_group_association" "hr_bas_sub_nsg_association" {
  subnet_id                 = azurerm_subnet.hr_bas_sub.id
  network_security_group_id = azurerm_network_security_group.hr_bas_nsg.id
}

# with HR Subnet
resource "azurerm_subnet_network_security_group_association" "hr_sub_nsg_association" {
  subnet_id                 = azurerm_subnet.hr_sub.id
  network_security_group_id = azurerm_network_security_group.hr_nsg.id
}

# Associates a NSG

# HR Vnet
#---------------------------------------------------------------------------------------------------------------#


# IT Vnet
#---------------------------------------------------------------------------------------------------------------#

# Creating HR Vnet   

resource "azurerm_virtual_network" "it_vnet" {
  name                = var.it_vnet_name
  resource_group_name = var.resource_group_name
  location            = var.region
  address_space       = var.it_vnet_address_space

}

# IT Subnet

resource "azurerm_subnet" "it_sub" {
  name                 = var.it_sub_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.it_vnet.name
  address_prefixes     = var.it_sub_address_prefixes

}

# NSG with rules

# IT Subnet    
resource "azurerm_network_security_group" "it_nsg" {
  name                = var.it_nsg_name
  resource_group_name = var.resource_group_name
  location            = var.region
}

resource "azurerm_network_security_rule" "it_nsg_rule" {
  name                        = var.it_nsg_rule_name
  resource_group_name         = var.resource_group_name
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  access                      = "Allow"
  priority                    = "100"
  direction                   = "Inbound"
  network_security_group_name = azurerm_network_security_group.it_nsg.name
}

# NSG with rules

# Associates a NSG 

# with IT Subnet
resource "azurerm_subnet_network_security_group_association" "it_sub_nsg_association" {
  subnet_id                 = azurerm_subnet.it_sub.id
  network_security_group_id = azurerm_network_security_group.it_nsg.id
}

# Associates a NSG 


# IT Vnet
#---------------------------------------------------------------------------------------------------------------#


# Finance Vnet
#---------------------------------------------------------------------------------------------------------------#

# Creating Finance Vnet   

resource "azurerm_virtual_network" "fin_vnet" {
  name                = var.fin_vnet_name
  resource_group_name = var.resource_group_name
  location            = var.region
  address_space       = var.fin_vnet_address_space

}

# Finance Subnet

resource "azurerm_subnet" "fin_sub" {
  name                 = var.fin_sub_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.fin_vnet.name
  address_prefixes     = var.fin_sub_address_prefixes

}

# NSG with rules

# Finance Subnet    
resource "azurerm_network_security_group" "fin_nsg" {
  name                = var.fin_nsg_name
  resource_group_name = var.resource_group_name
  location            = var.region
}

resource "azurerm_network_security_rule" "fin_nsg_rule" {
  name                        = var.fin_nsg_rule_name
  resource_group_name         = var.resource_group_name
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  access                      = "Allow"
  priority                    = "100"
  direction                   = "Inbound"
  network_security_group_name = azurerm_network_security_group.fin_nsg.name
}

# NSG with rules

# Associates a NSG 

# with Finance Subnet
resource "azurerm_subnet_network_security_group_association" "fin_sub_nsg_association" {
  subnet_id                 = azurerm_subnet.fin_sub.id
  network_security_group_id = azurerm_network_security_group.fin_nsg.id
}

# Associates a NSG 


# Finance Vnet
#---------------------------------------------------------------------------------------------------------------#



# Vnets Peering
#---------------------------------------------------------------------------------------------------------------#

resource "azurerm_virtual_network_peering" "hr_vnet_to_it_vnet" {
  name                         = var.hr_vnet_to_it_vnet_peering_name
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.hr_vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.it_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "hr_vnet_to_fin_vnet" {
  name                         = var.hr_vnet_to_fin_vnet_peering_name
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.hr_vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.fin_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "it_vnet_to_hr_vnet" {
  name                         = var.it_vnet_to_hr_vnet_peering_name
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.it_vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.hr_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "it_vnet_to_fin_vnet" {
  name                         = var.it_vnet_to_fin_vnet_peering_name
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.it_vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.fin_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "fin_vnet_to_hr_vnet" {
  name                         = var.fin_vnet_to_hr_vnet_peering_name
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.fin_vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.hr_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}


resource "azurerm_virtual_network_peering" "fin_vnet_to_it_vnet" {
  name                         = var.fin_vnet_to_it_vnet_peering_name
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.fin_vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.it_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

# Vnets Peering
#---------------------------------------------------------------------------------------------------------------#