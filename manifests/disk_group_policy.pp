class ucsm_dockerdc::disk_group_policy(
$disk_group_policy_list=undef,
){
    include ::ucsm_dockerdc

    if ($disk_group_policy_list != undef) {
        $disk_group_policy_list.each |$disk_group_policy| {
            notify { "${disk_group_policy['name']}" : }
            ucsm_disk_group_policy{"diskGroup ${disk_group_policy['name']}":
	        policy_name => "${disk_group_policy['name']}",
                slot_numbers => ["1", "2"],
                raid_level => "${disk_group_policy['RAID_level']}",
	        ip => "${ucsm_dockerdc::login_info['ip']}",
	        username => "${ucsm_dockerdc::login_info['username']}",
	        password => "${ucsm_dockerdc::login_info['password']}",
	        state => 'present',
		
	    }
	}
    }
}
