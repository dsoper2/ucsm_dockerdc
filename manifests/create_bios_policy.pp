class ucsm_dockerdc::create_bios_policy(
$bios_policy_name=undef,
$consistent_device_naming=undef
){
    if ($bios_policy_name != undef) {
        notify { "${bios_policy_name}" :
	    message => "dev naming ${consistent_device_naming}",
        }
    }
}
