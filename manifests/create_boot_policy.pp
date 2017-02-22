class ucsm_dockerdc::create_boot_policy(
$boot_policy_name=undef,
$boot_device_list=undef
){
    if ($boot_policy_name != undef) {
        notify { "${boot_policy_name}" : }
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
            ip => '172.16.143.136',
            username => 'username',
            password => 'password',
        }
    }
}
