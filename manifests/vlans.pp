class ucsm_dockerdc::vlans(
$vlan_list=undef,
){
    if ($vlan_list != undef) {
        $vlan_list.each |$vlan| {
            notify { "${vlan['name']}" :
	        message => "id ${vlan['id']} native ${vlan['native']}"
            }
	    ucsm_vlan{"fabricVlan ${vlan['name']}":
	        policy_name => "${vlan['name']}",
	        id => "${vlan['id']}",
	        default_net => "${vlan['native']}",
	        ip => "${ucsm_dockerdc::login_info['ip']}",
                username => "${ucsm_dockerdc::login_info['username']}",
                password => "${ucsm_dockerdc::login_info['password']}",
                state => 'present',
	    }
        }
    }
}
