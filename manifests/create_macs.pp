class ucsm_dockerdc::create_macs(
$mac_list=undef,
){
    if ($mac_list != undef) {
        $mac_list.each |$mac| {
            notify { "${mac['name']}" :
	        message => "start ${mac['start']} end ${mac['end']}"
            }
        }
    }
}
