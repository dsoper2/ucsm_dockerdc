class ucsm_dockerdc::uuids(
$uuid_list=undef,
){
    include ::ucsm_dockerdc

    if ($uuid_list != undef) {
        $uuid_list.each |$uuid| {
            notify { "UUID ${uuid['name']}" :
	        message => "from ${uuid['from']}, to ${uuid['to']}"
            }
            ucsm_uuid_pool{"${uuid['name']}":
                policy_name => "${uuid['name']}",
                to => "${uuid['to']}",
                r_from => "${uuid['from']}",
	        ip => "${ucsm_dockerdc::login_info['ip']}",
	        username => "${ucsm_dockerdc::login_info['username']}",
	        password => "${ucsm_dockerdc::login_info['password']}",
	        state => 'present',
            }
        }
    }
}
