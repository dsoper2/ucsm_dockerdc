class ucsm_dockerdc::storage_profile(
$storage_profile_list=undef,
){
    include ::ucsm_dockerdc

    if ($storage_profile_list != undef) {
        $storage_profile_list.each |$storage_profile| {
            notify { "${storage_profile['name']}" : }
	    $storage_profile['lun_list'].each |$lun| {
	        ucsm_storageprofile { "${storage_profile['name']} ${lun['lun_name']}" :
	            policy_name => "${storage_profile['name']}",
	            local_lun_list => [{"name" => "${lun['lun_name']}","size" => "${lun['size']}","disk_group_configuration_name" => "${lun['disk_group_policy']}"}],
	            ip => "${ucsm_dockerdc::login_info['ip']}",
	            username => "${ucsm_dockerdc::login_info['username']}",
	            password => "${ucsm_dockerdc::login_info['password']}",
	            state => 'present',
	        }
	    }
	}
    }
}
