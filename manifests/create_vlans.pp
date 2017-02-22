class ucsm_dockerdc::create_vlans(
$vlan_list=undef,
){
    if ($vlan_list != undef) {
        $vlan_list.each |$vlan| {
            notify { "${vlan['name']}" :
	        message => "id ${vlan['id']} native ${vlan['native']}"
            }
        }
    }
}
