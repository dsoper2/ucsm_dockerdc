class ucsm_dockerdc::macs(
$mac_list=undef,
){
    if ($mac_list != undef) {
        $mac_list.each |$mac| {
            notify { "${mac['name']}" :
	        message => "start ${mac['start']} end ${mac['end']}"
            }
	    ucsm_macpool{'macpoolPool':
	        policy_name => "${mac['name']}",
	        descr =>"",
	        r_from => "${mac['start']}",
	        to => "${mac['end']}",
	        ip => "${ucsm_dockerdc::login_info['ip']}",
	        username => "${ucsm_dockerdc::login_info['username']}",
	        password => "${ucsm_dockerdc::login_info['password']}",
	        state => "present",
	    }
        }
    }
}
