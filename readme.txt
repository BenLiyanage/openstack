Description

This vagrant configuration is being built to automate the deployment of openstack, outlined roughly here:

http://thornelabs.net/2013/12/19/deploy-rackspace-private-cloud-v42x-powered-by-openstack-havana-with-neutron-networking-using-virtualbox-or-vmware-fusion-and-vagrant.html

(also here, though this is very similar to the above
http://cloudarchitectmusings.com/2013/12/01/deploy-openstack-havana-on-your-laptop-using-vagrant-and-chef/)

Pre-Requesites

To get this up and running, you need the following:

* GitHub Account
* Vagrant (confirmed on version 1.4.3)
* Virtual Box (confirmed on 4.2)
* 64-bit OS
* enable VT-x/AMD-V in bios (IMPORTANT.  Your VMs will not boot.  Openstack requires a 64-bit os)
* ~ 10 spare gigs of RAM

Optional Recommended Software:

* NotePad++
* GitHub Windows Client

Installation Instructions

* Checkout the repository
* From the repository directory, run the command "vagrant up"

Current Road Blocks

* Currently the chef server is installed, however, the knife command is not initialized after installation.

I have tried several things to fix this.  Currently I have an "expect" answer file (/cookbooks/chef/files/default/knife.exp) that is deployed.  When run manually by ssh'ing into the box this answer file will correctly initialize knife, however when the script is run during the vagrant provisioning process this script does not initialize knife.  I believe this may be because it is not initializing knife for the correct user. 

* This vagrant file will currently only set up the Chef Server.  

The other nodes are currently commented out in the vagrant file.  After the chef server is set up correctly, these will need to be enabled, with some additional scripting to automate their deployment.  Once this is fixed, the tutorial can be resumed from this text "Install the Rackspace Private Cloud v4.2.x powered by OpenStack Havana Chef Cookbooks:"

Notes & Trouble Shooting Tips

* Booting Your First VM

If you get a timeout error while trying to boot your first VM, you may need to enable VT-x/AMD-V in your bios.  To help troubleshoot the issue you can add the following to your vagrant config file below the box_url:

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
  end

This will allow you to see any errors that virtual box is throwing.  After resolving any virtual box issues, this line will need to be removed, and you will need to reinitialize your vagrant environment (Aka, "vagrant destroy" followed by "vagrant up".)
  
* Provisioning Chef

If you are seeing the following error while provisioning the chef server:

": no such file or directory

it is because the file (./cookbooks/chef/files/default/knife.exp) is not saved in the correct format.  In Notepad++ go to edit->EOL->Unix and this should fix the issue.