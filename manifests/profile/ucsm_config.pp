class ucsm_dockerdc::profile::ucsm_config{
  # shared infrastructure pools and policies

  # Configuring VLANs
  include ::ucsm_dockerdc::vlans

  # Configuring LAN Pools
  include ::ucsm_dockerdc::macs

  # Configuring vNIC Templates
  include ::ucsm_dockerdc::vnic_templates

  # Configuring BIOS Policy
  include ::ucsm_dockerdc::bios_policy

  # Configuring Boot Policy
  include ::ucsm_dockerdc::boot_policy

  # Configuring Storage Profile
  include ::ucsm_dockerdc::storage_profile

}
