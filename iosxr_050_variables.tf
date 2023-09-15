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
      router_b           = "p03"
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
    pe03_pe04 = {
      description        = "PE03_to_PE04"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.36/30"
      subnet_ipv6        = "fc00:10:31:0:36::0/64"
      router_a           = "pe03"
      router_a_interface = "GigabitEthernet0/0/0/10"
      router_b           = "pe04"
      router_b_interface = "GigabitEthernet0/0/0/10"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
    p01_p02 = {
      description        = "P01_to_P02"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.40/30"
      subnet_ipv6        = "fc00:10:31:0:40::0/64"
      router_a           = "p01"
      router_a_interface = "GigabitEthernet0/0/0/10"
      router_b           = "p02"
      router_b_interface = "GigabitEthernet0/0/0/10"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
    p03_p04 = {
      description        = "P03_to_P04"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.44/30"
      subnet_ipv6        = "fc00:10:31:0:44::0/64"
      router_a           = "p03"
      router_a_interface = "GigabitEthernet0/0/0/10"
      router_b           = "p04"
      router_b_interface = "GigabitEthernet0/0/0/10"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
    p01_p03 = {
      description        = "P01_to_P03"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.48/30"
      subnet_ipv6        = "fc00:10:31:0:48::0/64"
      router_a           = "p01"
      router_a_interface = "GigabitEthernet0/0/0/2"
      router_b           = "p03"
      router_b_interface = "GigabitEthernet0/0/0/2"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
    p01_p04 = {
      description        = "P01_to_P04"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.52/30"
      subnet_ipv6        = "fc00:10:31:0:52::0/64"
      router_a           = "p01"
      router_a_interface = "GigabitEthernet0/0/0/3"
      router_b           = "p04"
      router_b_interface = "GigabitEthernet0/0/0/2"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
    p02_p03 = {
      description        = "P02_to_P03"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.56/30"
      subnet_ipv6        = "fc00:10:31:0:56::0/64"
      router_a           = "p02"
      router_a_interface = "GigabitEthernet0/0/0/2"
      router_b           = "p03"
      router_b_interface = "GigabitEthernet0/0/0/3"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
    p02_p04 = {
      description        = "P02_to_P04"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.60/30"
      subnet_ipv6        = "fc00:10:31:0:60::0/64"
      router_a           = "p02"
      router_a_interface = "GigabitEthernet0/0/0/3"
      router_b           = "p04"
      router_b_interface = "GigabitEthernet0/0/0/3"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
    asbr01_asbr02 = {
      description        = "ASBR01_to_ASBR02"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.64/30"
      subnet_ipv6        = "fc00:10:31:0:64::0/64"
      router_a           = "asbr01"
      router_a_interface = "GigabitEthernet0/0/0/10"
      router_b           = "asbr02"
      router_b_interface = "GigabitEthernet0/0/0/10"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
    p02_asbr01 = {
      description        = "P02_to_ASBR01"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.72/30"
      subnet_ipv6        = "fc00:10:31:0:72::0/64"
      router_a           = "p02"
      router_a_interface = "GigabitEthernet0/0/0/4"
      router_b           = "asbr01"
      router_b_interface = "GigabitEthernet0/0/0/0"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
    p02_asbr02 = {
      description        = "P02_to_ASBR02"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.80/30"
      subnet_ipv6        = "fc00:10:31:0:80::0/64"
      router_a           = "p02"
      router_a_interface = "GigabitEthernet0/0/0/5"
      router_b           = "asbr02"
      router_b_interface = "GigabitEthernet0/0/0/0"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
    p04_asbr01 = {
      description        = "P04_to_ASBR01"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.88/30"
      subnet_ipv6        = "fc00:10:31:0:88::0/64"
      router_a           = "p04"
      router_a_interface = "GigabitEthernet0/0/0/4"
      router_b           = "asbr01"
      router_b_interface = "GigabitEthernet0/0/0/1"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
    p04_asbr02 = {
      description        = "P04_to_ASBR02"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.96/30"
      subnet_ipv6        = "fc00:10:31:0:96::0/64"
      router_a           = "p04"
      router_a_interface = "GigabitEthernet0/0/0/5"
      router_b           = "asbr02"
      router_b_interface = "GigabitEthernet0/0/0/1"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
    p01_rrpce01 = {
      description        = "P01_to_RRPCE01"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.104/30"
      subnet_ipv6        = "fc00:10:31:0:104::0/64"
      router_a           = "p01"
      router_a_interface = "GigabitEthernet0/0/0/4"
      router_b           = "rrpce01"
      router_b_interface = "GigabitEthernet0/0/0/0"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
    p03_rrpce02 = {
      description        = "P02_to_RRPCE02"
      mtu                = 9126
      subnet_ipv4        = "10.31.0.112/30"
      subnet_ipv6        = "fc00:10:31:0:112::0/64"
      router_a           = "p03"
      router_a_interface = "GigabitEthernet0/0/0/4"
      router_b           = "rrpce02"
      router_b_interface = "GigabitEthernet0/0/0/0"
      cdp                = "true"
      shutdown           = "false"
      bandwidth          = "1000000"
    },
  }
}

variable "loopback_ips" {
  type = map(any)
  default = {
    pe01 = {
      loopback_id  = 0
      ipv4_address = "10.31.1.1"
      ipv6_address = "fc00:10:31:1:0::1"
    },
    pe02 = {
      loopback_id  = 0
      ipv4_address = "10.31.1.2"
      ipv6_address = "fc00:10:31:1:0::2"
    },
    p01 = {
      loopback_id  = 0
      ipv4_address = "10.31.1.3"
      ipv6_address = "fc00:10:31:1:0::3"
    },
    p02 = {
      loopback_id  = 0
      ipv4_address = "10.31.1.4"
      ipv6_address = "fc00:10:31:1:0::4"
    },
    p03 = {
      loopback_id  = 0
      ipv4_address = "10.31.1.5"
      ipv6_address = "fc00:10:31:1:0::5"
    },
    p04 = {
      loopback_id  = 0
      ipv4_address = "10.31.1.6"
      ipv6_address = "fc00:10:31:1:0::6"
    },
    pe03 = {
      loopback_id  = 0
      ipv4_address = "10.31.1.7"
      ipv6_address = "fc00:10:31:1:0::7"
    },
    pe04 = {
      loopback_id  = 0
      ipv4_address = "10.31.1.8"
      ipv6_address = "fc00:10:31:1:0::8"
    },
    asbr01 = {
      loopback_id  = 0
      ipv4_address = "10.31.1.9"
      ipv6_address = "fc00:10:31:1:0::9"
    },
    asbr02 = {
      loopback_id  = 0
      ipv4_address = "10.31.1.10"
      ipv6_address = "fc00:10:31:1:0::10"
    },
    rrpce01 = {
      loopback_id  = 0
      ipv4_address = "10.31.1.11"
      ipv6_address = "fc00:10:31:1:0::11"
    },
    rrpce02 = {
      loopback_id  = 0
      ipv4_address = "10.31.1.12"
      ipv6_address = "fc00:10:31:1:0::12"
    },
  }
}