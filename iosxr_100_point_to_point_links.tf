resource "iosxr_interface" "links_side_a" {
  for_each       = var.p2p_links
  device         = each.value.router_a
  interface_name = each.value.router_a_interface
  shutdown       = each.value.shutdown
  mtu            = each.value.mtu
  bandwidth      = each.value.bandwidth
  description    = each.value.description
  ipv4_address   = cidrhost(each.value.subnet_ipv4, 1)
  ipv4_netmask   = cidrnetmask(each.value.subnet_ipv4)
  ipv6_enable    = true
  ipv6_addresses = [
    {
      address       = cidrhost(each.value.subnet_ipv6, 1)
      prefix_length = 64
    }
  ]
}

resource "iosxr_interface" "links_side_b" {
  for_each       = var.p2p_links
  device         = each.value.router_b
  interface_name = each.value.router_b_interface
  shutdown       = each.value.shutdown
  mtu            = each.value.mtu
  bandwidth      = each.value.bandwidth
  description    = each.value.description
  ipv4_address   = cidrhost(each.value.subnet_ipv4, 2)
  ipv4_netmask   = cidrnetmask(each.value.subnet_ipv4)
  ipv6_enable    = true
  ipv6_addresses = [
    {
      address       = cidrhost(each.value.subnet_ipv6, 2)
      prefix_length = 64
    }
  ]
}