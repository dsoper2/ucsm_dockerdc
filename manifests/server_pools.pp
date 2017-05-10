class ucsm_dockerdc::server_pools(
$server_pool_list=undef,
){
    include ::ucsm_dockerdc

    if ($server_pool_list != undef) {
        $server_pool_list.each |$server_pool| {
            notify { "${server_pool['name']}" : }
	    $server_pool['server_list'].each |$server| {
	        ucsm_serverpool{ "${server_pool['name']}" :
	            policy_name => "${server_pool['name']}",
	            pooled_servers => [{"slot_id" => "${server['slot_id']}","chassis_id" =>"${server['chassis_id']}"}],
	            ip => "${ucsm_dockerdc::login_info['ip']}",
	            username => "${ucsm_dockerdc::login_info['username']}",
	            password => "${ucsm_dockerdc::login_info['password']}",
	            state => 'present',
	        }
	    }
        }
    }
}
