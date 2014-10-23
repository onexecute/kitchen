#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# This will install php5 to the server. /etc/php
package "php" do
	action :install
end

# If the php.ini file does not match what is current on the chef server upload.
# creates a backup of old php.ini and creates a new one.

cookbook_file "/etc/php.ini" do
	source "php.ini"
	mode "0644"
end
