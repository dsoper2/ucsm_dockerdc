class ucsm_dockerdc::create_vnic_templates(
$vnic_list=undef,
){
    if ($vnic_list != undef) {
        $vnic_list.each |$vnic| {
            notify { "${vnic['name']}" :
	        message => "fabric ${vnic['fabric']} macs ${vnic['mac_pool']}",
            }
	    $vnic['vlan_list'].each |$vlan| {
	        notify { "${vlan['name']}" :
		    message => "native ${vlan['native']}",
		}
	    }
        }
    }
}
