class ucsm_dockerdc::vlans(
$vlan_list=undef,
){
    if ($vlan_list != undef) {
        $vlan_list.each |$vlan| {
            notify { "${vlan['name']}" :
	        message => "id ${vlan['id']} native ${vlan['native']}"
            }
	    ucsm_vlan{"${vlan['name']}":
	        policy_name => "${vlan['name']}",
	        sharing =>'none',
	        id => "${vlan['id']}",
	        mcast_policy_name => 'default',
	        policy_owner => 'local', # default
	        default_net => "${vlan['native']}",
	        pub_nw_name => '', # default
	        compression_type => 'included', # default
	        ip => "${ucsm_dockerdc::login_info['ip']}",
                username => "${ucsm_dockerdc::login_info['username']}",
                password => "${ucsm_dockerdc::login_info['password']}",
                state => 'present',
	    }
        }
    }
}
