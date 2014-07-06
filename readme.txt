

Notes

Provisioning Chef

If you are seeing the following error while provisioning the chef server:

": no such file or directory

it is because the file (./cookbooks/chef/files/default/knife.exp) is not saved in the correct format.  In Notepad++ go to edit->EOL->Unix and this should fix the issue.