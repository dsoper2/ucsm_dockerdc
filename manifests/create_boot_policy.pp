class ucsm_dockerdc::create_boot_policy (
$boot_policy_name=undef,
$boot_device_list=undef,
) {
    if ($boot_policy_name != undef) {
        notify { "${boot_policy_name}" :
            message => "ip ${ucsm_dockerdc::login_info['ip']}, user ${ucsm_dockerdc::login_info['username']}, pass ${ucsm_dockerdc::login_info['password']}",
        }
        $boot_device_list.each |$boot_device| {
	    notify { "${boot_device['name']}" : }
	}
        boot_policy{'policy':
            confuse => $boot_policy_name,
            descr => 'testing',
            reboot_on_update => 'no',
            policy_owner => 'local',
            enforce_vnic_name => 'yes',
            boot_mode => 'legacy',
            state => 'present',
            ip => "${ucsm_dockerdc::login_info['ip']}",
            username => "${ucsm_dockerdc::login_info['username']}",
            password => "${ucsm_dockerdc::login_info['password']}",
        }
    }
}
