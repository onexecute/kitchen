#
# Cookbook Name:: localusers
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

#
#Searches the data bags (loops)on the chef server for each  user in the data bag.


search(:user, "*:*").each do |data|
	user data["id"] do
		comment data["comment"]
		uid data["uid"]
		gid data["gid"]
		home data["home"]
		shell data["shell"]
	end
end

#Calls the groups recipe
include_recipe "localusers::group"
