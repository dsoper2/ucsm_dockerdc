class ucsm_dockerdc::storage_profile(
$storage_profile_list=undef,
){
    if ($storage_profile_list != undef) {
        $storage_profile_list.each |$storage_profile| {
            notify { "${storage_profile['name']}" : }
	    ucsm_storageprofile { "${storage_profile['name']}" :
	        policy_name => "${storage_profile['name']}",
	        local_lun_list => [{"name" => "Boot-Lun","size" => "50","disk_group_configuration_name" => "pte88","slot_number" => ["1","2"]}, {"name" => "Data-Lun","size" => "20","disk_group_configuration_name" => "puppettes","slot_number" => ["1","2"]}],
	        ip => "${ucsm_dockerdc::login_info['ip']}",
	        username => "${ucsm_dockerdc::login_info['username']}",
	        password => "${ucsm_dockerdc::login_info['password']}",
	        state => 'present',
	    }
	}
    }
}
