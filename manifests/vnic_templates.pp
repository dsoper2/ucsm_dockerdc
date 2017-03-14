class ucsm_dockerdc::vnic_templates(
$vnic_list=undef,
){
    if ($vnic_list != undef) {
        $vnic_list.each |$vnic| {
            notify { "${vnic['name']}" :
	        message => "fabric ${vnic['fabric']} macs ${vnic['mac_pool']}",
            }
	    $vnic['vlan_list'].each |$vlan| {
	        notify { "vlan name ${vlan['vlan_name']}" :
		    message => "native ${vlan['native']}",
		}
	        ucsm_vnic_template {"vnicLanConnTempl":
	            policy_name =>"${vnic['name']}",
	            descr => '',
	            switch_id =>"${vnic['fabric']}",
	            redundancy_pair_type => "none",
	            templ_type => "updating-template",
	            vlan_name => "${vlan['vlan_name']}",
	            default_net =>"${vlan['native']}",
	            cdn_source => "user-defined",
	            admin_cdn_name =>"${vnic['cdn_name']}",
	            mtu => "${vnic['mtu']}",
	            ident_pool_name => "${vnic['mac_pool']}",
	            ip => "${ucsm_dockerdc::login_info['ip']}",
	            username => "${ucsm_dockerdc::login_info['username']}",
	            password => "${ucsm_dockerdc::login_info['password']}",
	            state => "present",
	        }
	    }
        }
    }
}
