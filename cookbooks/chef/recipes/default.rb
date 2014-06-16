execute "install-chef-server" do
  command "curl -O https://raw.githubusercontent.com/rcbops/support-tools/master/chef-install/install-chef-server.sh
chmod +x install-chef-server.sh
export CHEF_URL=""https://chef:443""
./install-chef-server.sh"
  only_if do
    !File.directory?('/etc/chef-server')
  end
end

# configure knife
cookbook_file "/home/vagrant/.chef/knife.rb"
  action :create_if_missing
end
# l/p is vagrant/vagrant
cookbook_file "/home/vagrant/.chef/vagrant.pem"
  action :create_if_missing
end

execute "install-cookbooks" do
  command "git clone https://github.com/rcbops/chef-cookbooks.git
cd chef-cookbooks
git checkout v4.2.2
git submodule init
git submodule sync
git submodule update
knife cookbook upload -a -o cookbooks
knife role from file roles/*rb"
  only_if do
    !File.directory?('/home/vagrant/chef-cookbooks')
  end
end

