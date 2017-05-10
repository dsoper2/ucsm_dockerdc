class ucsm_dockerdc::bios_policy (
$bios_policy_name=undef,
$consistent_device_naming=undef
){
    include ::ucsm_dockerdc

    if ($bios_policy_name != undef) {
        notify { "${bios_policy_name}" :
	    message => "dev naming ${consistent_device_naming}",
        }
        ucsm_bios_policy{ "biosVProfile ${bios_policy_name}" :
            policy_name => "${bios_policy_name}",
            descr =>'',
            consistent_device_naming => "${consistent_device_naming}",
            ip => "${ucsm_dockerdc::login_info['ip']}",
            username => "${ucsm_dockerdc::login_info['username']}",
            password => "${ucsm_dockerdc::login_info['password']}",
            state => 'present',
        }
    }
}
