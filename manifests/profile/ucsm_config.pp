class ucsm_dockerdc::profile::ucsm_config{
  # shared infrastructure pools and policies

  # Configuring VLANs
  include ::ucsm_dockerdc::vlans

  # Configuring LAN (MAC) Pools
  include ::ucsm_dockerdc::macs

  # Configuring vNIC Templates
  include ::ucsm_dockerdc::vnic_templates

  # Configuring BIOS Policy
  include ::ucsm_dockerdc::bios_policy

  # Configuring Boot Policy
  include ::ucsm_dockerdc::boot_policy

  # Configuring UUID and Server Pools
  include ::ucsm_dockerdc::uuids
  include ::ucsm_dockerdc::server_pools

  # Configuring Disk Group Policy
  include ::ucsm_dockerdc::disk_group_policy

  # Configuring Storage Profile
  include ::ucsm_dockerdc::storage_profile

  # Creating Service Profile Templates
  include ::ucsm_dockerdc::service_profile_templates

}
