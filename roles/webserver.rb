#List the recipes that will be assigned to servers in this Role.
#
name "webserver"
description "webserver role"
run_list "role[base]", "recipe[apache]"
