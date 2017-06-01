class ucsm_dockerdc::service_profile_templates(
$service_profile_template_list=undef,
){
    include ::ucsm_dockerdc

    if ($service_profile_template_list != undef) {
        $service_profile_template_list.each |$service_profile_template| {
            $service_profile_template['vnic_list'].each |$vnic| {
                notify { "${service_profile_template['name']} ${vnic['vnic_name']}" : }
                ucsm_serviceprofiletemplate{"${service_profile_template['name']} ${vnic['vnic_name']}":
	            policy_name => "${service_profile_template['name']}",
                    type  => "${service_profile_template['template_type']}",
                    storage_profile_name => "${service_profile_template['storage_profile']}",
                    vnic_name => "${vnic['vnic_name']}",
                    vnic_template_name => "${vnic['vnic_template']}",
                    adapter_profile_name => "${vnic['vnic_adapter_policy']}",
                    vnic_order => "${vnic['vnic_order']}",
                    server_pool_name => "${service_profile_template['server_pool']}",
                    local_disk_policy_name => 'default',
                    ident_pool_name=> "${service_profile_template['uuid_pool']}",
                    host_fw_policy_name => 'default',
                    boot_policy_name => "${service_profile_template['boot_policy']}",
                    bios_profile_name => "${service_profile_template['bios_policy']}",
                    maint_policy_name => 'default',
                    mgmt_ip_address => 'ext-mgmt',
	            ip => "${ucsm_dockerdc::login_info['ip']}",
	            username => "${ucsm_dockerdc::login_info['username']}",
	            password => "${ucsm_dockerdc::login_info['password']}",
	            state => 'present',
                }
	    }
	}
    }
}
