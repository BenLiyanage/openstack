log_level                :info
log_location             STDOUT
node_name                'vagrant'
client_key               '/home/vagrant/.chef/vagrant.pem'
validation_client_name   'chef-validator'
validation_key           '/etc/chef-server/chef-validator.pem'
chef_server_url          'https://chef:443'
syntax_check_cache_path  '/home/vagrant/.chef/syntax_check_cache'