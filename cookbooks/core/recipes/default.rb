execute "apt-get-update-periodic" do
  command "apt-get update"
  only_if do
    !File.exists?('/var/lib/apt/periodic/update-success-stamp') ||
    File.mtime('/var/lib/apt/periodic/update-success-stamp') < Time.now - 86400
  end
end

package "curl" do
  action :install
end

package "vim" do
  action :install
end

package "git" do
  action :install
end

package "expect" do
  action :install
end