#List the recipes that will be assigned to servers in this Role.
#
name "base"
description "contains recipes that should be run on all servers"
run_list "recipe[chef-client::delete_validation]", "recipe[chef-client::cron]", "recipe[chef-client]", "recipe[localusers]"

