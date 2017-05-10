class ucsm_dockerdc::uuids(
$uuid_list=undef,
){
    include ::ucsm_dockerdc

    if ($uuid_list != undef) {
        $uuid_list.each |$uuid| {
            notify { "UUID ${uuid['name']}" :
	        message => "from ${uuid['from']}, size ${uuid['size']}"
            }
        }
    }
}
