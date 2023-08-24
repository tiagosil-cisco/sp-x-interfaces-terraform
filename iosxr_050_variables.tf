locals {
  project_title       = "SP-B"
  project_description = "Topology created using Terraform to represent SP-X"

  routers = [
    {
      name = "pe01"
      host = "10.0.1.51"
    },
    {
      name = "pe02"
      host = "10.0.1.52"
    },
    {
      name = "p01"
      host = "10.0.1.53"
    },
    {
      name = "p02"
      host = "10.0.1.54"
    },
    {
      name = "p03"
      host = "10.0.1.55"
    },
    {
      name = "p04"
      host = "10.0.1.56"
    },
    {
      name = "pe03"
      host = "10.0.1.57"
    },
    {
      name = "pe04"
      host = "10.0.1.58"
    },
    {
      name = "asbr01"
      host = "10.0.1.59"
    },
    {
      name = "asbr02"
      host = "10.0.1.60"
    },
    {
      name = "rrpce01"
      host = "10.0.1.61"
    },
    {
      name = "rrpce02"
      host = "10.0.1.62"
    },
  ]

  xr_username = "admin"
  xr_password = "C!sco123"
}

variable "p2p_links" {
  type = map(any)
  default = {
    pe01_p01 = {
      description        = "PE01_to_P01"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.0/30"
      subnet_ipv6        = "fc00:10:31:0:0::0/64"
      router_a           = "pe01"
      router_a_interface = "GigabitEthernet0/0/0/0"
      router_b           = "p01"
      router_b_interface = "GigabitEthernet0/0/0/0"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
    pe01_p02 = {
      description        = "PE01_to_P02"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.4/30"
      subnet_ipv6        = "fc00:10:31:0:4::0/64"
      router_a           = "pe01"
      router_a_interface = "GigabitEthernet0/0/0/1"
      router_b           = "p02"
      router_b_interface = "GigabitEthernet0/0/0/0"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
    pe02_p01 = {
      description        = "PE02_to_P01"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.8/30"
      subnet_ipv6        = "fc00:10:31:0:8::0/64"
      router_a           = "pe02"
      router_a_interface = "GigabitEthernet0/0/0/0"
      router_b           = "p01"
      router_b_interface = "GigabitEthernet0/0/0/1"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
    pe02_p02 = {
      description        = "PE02_to_P02"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.12/30"
      subnet_ipv6        = "fc00:10:31:0:12::0/64"
      router_a           = "pe02"
      router_a_interface = "GigabitEthernet0/0/0/1"
      router_b           = "p02"
      router_b_interface = "GigabitEthernet0/0/0/1"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
    pe03_p03 = {
      description        = "PE03_to_P03"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.16/30"
      subnet_ipv6        = "fc00:10:31:0:16::0/64"
      router_a           = "pe03"
      router_a_interface = "GigabitEthernet0/0/0/0"
      router_b           = "p03"
      router_b_interface = "GigabitEthernet0/0/0/0"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
    pe03_p04 = {
      description        = "PE03_to_P04"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.20/30"
      subnet_ipv6        = "fc00:10:31:0:20::0/64"
      router_a           = "pe03"
      router_a_interface = "GigabitEthernet0/0/0/1"
      router_b           = "p04"
      router_b_interface = "GigabitEthernet0/0/0/0"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
    pe04_p03 = {
      description        = "PE04_to_P03"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.24/30"
      subnet_ipv6        = "fc00:10:31:0:24::0/64"
      router_a           = "pe04"
      router_a_interface = "GigabitEthernet0/0/0/0"
      router_b           = "p02"
      router_b_interface = "GigabitEthernet0/0/0/1"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
    pe04_p04 = {
      description        = "PE04_to_P04"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.28/30"
      subnet_ipv6        = "fc00:10:31:0:28::0/64"
      router_a           = "pe04"
      router_a_interface = "GigabitEthernet0/0/0/1"
      router_b           = "p04"
      router_b_interface = "GigabitEthernet0/0/0/1"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
    pe01_pe02 = {
      description        = "PE01_to_PE02"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.32/30"
      subnet_ipv6        = "fc00:10:31:0:32::0/64"
      router_a           = "pe01"
      router_a_interface = "GigabitEthernet0/0/0/10"
      router_b           = "pe02"
      router_b_interface = "GigabitEthernet0/0/0/10"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
  }
}

