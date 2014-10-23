# See http://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "chefcemartinjr"
client_key               "#{current_dir}/chefcemartinjr.pem"
validation_client_name   "onexecute_llc-validator"
validation_key           "#{current_dir}/onexecute_llc-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/onexecute_llc"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
