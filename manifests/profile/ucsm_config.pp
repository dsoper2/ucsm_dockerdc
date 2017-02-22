class ucsm_dockerdc::profile::ucsm_config{
  # shared infrastructure pools and policies

  # Creating VLANs
  include ::ucsm_dockerdc::create_vlans

  # Creating LAN Pools
  include ::ucsm_dockerdc::create_macs

  # Creating vNIC Templates
  include ::ucsm_dockerdc::create_vnic_templates

  # Creating BIOS Policy
  include ::ucsm_dockerdc::create_bios_policy

  # Creating Boot Policy
  include ::ucsm_dockerdc::create_boot_policy

}
