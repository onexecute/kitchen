#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#check linux distrobution, if ubuntu, run apt-get 

if node["platform"] == "ubuntu"
	execute "apt-get update -y" do
	end
end

# Install packages, apache2 for ubuntu and httpd for centos

package "apache2" do
	package_name node["apache"]["package"]
end

#Pulls in variables from tne attributes file

node["apache"]["sites"].each do |sitename, data|
	document_root = "/content/sites/#{sitename}"
	
	directory document_root do
		mode "0755"
		recursive true
	end

# determine distro. "platform" info comes from Ohai (node att)
if node["platform"] == "ubuntu"
	template_location = "/etc/apache2/sites-enabled/#{sitename}.conf"
elsif node["platform"] == "centos"
	template_location = "etc/httpd/conf.d/#{sitename}.conf"
end

#Creates .conf files in the /etc/httpd/conf.d directory.
#

template template_location do
	source "vhost.erb"
	mode "0644"
	variables(
		:document_root => document_root,
		:port => data["port"],
		:domain => data["domain"]
	)
	notifies :restart, "service[httpd]"
end

#Creates index.html files for each virtual host. 

template "/content/sites/#{sitename}/index.html" do
	source "index.html.erb"
	mode "0644"
	variables(
		:site_title => data["site_title"],
		:comingsoon => "Coming Soon!"
	)
end

# if the welcome.conf file exists delete it with the execute statement
# only_if  means do only if 

execute "rm /etc/httpd/conf.d/welcome.conf" do
	only_if do
		File.exist?("/etc/httpd/conf.d/welcome.conf"
	)
	end
	notifies :restart, "service[httpd]"
end 

execute "rm /etc/httpd/conf.d/README" do
	only_if do
		File.exist?("/etc/httpd/conf.d/README"
	)
	end
end

#Starts the apache service

service "httpd" do
	service_name node["apache"]["package"]
	action [:enable, :start]
end

#Calls the php recipe default file. 
#A depend statment is required in the apache metadata.erb file

#	include_recipe "php::default"
end

