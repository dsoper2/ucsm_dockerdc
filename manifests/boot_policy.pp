class ucsm_dockerdc::boot_policy (
$boot_policy_name=undef,
$boot_device_list=undef,
) {
    if ($boot_policy_name != undef) {
        notify { "${boot_policy_name}" :
            message => "ip ${ucsm_dockerdc::login_info['ip']}, user ${ucsm_dockerdc::login_info['username']}, pass ${ucsm_dockerdc::login_info['password']}",
        }
        $boot_device_list.each |$boot_device| {
	    notify { "${boot_device['device_name']}" : }
            ucsm_boot_policy{ "${boot_policy_name} ${boot_device['device_name']}" :
                policy_name => "${boot_policy_name}",
		device_name => "${boot_device['device_name']}",
		type => "${boot_device['type']}",
		order => "${boot_device['order']}",
                state => 'present',
                ip => "${ucsm_dockerdc::login_info['ip']}",
                username => "${ucsm_dockerdc::login_info['username']}",
                password => "${ucsm_dockerdc::login_info['password']}",
            }
	}
    }
}
