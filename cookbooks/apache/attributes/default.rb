default["apache"]["sites"]["webserver"] = { "site_title" => "webserver website coming soon", "port" => 80, "domain" => "webserver.localdomain.org" }
default["apache"]["sites"]["webserver2b"] = { "site_title" => "webserver2b website coming soon",  "port" => 80, "domain" => "webserver2b.localdomain.org" }
default["apache"]["sites"]["webserver3b"] = { "site_title" => "webserver3b website coming soon", "port" => 80, "domain" => "webserver3b.localdomain.org" }

case node["platform"]
when "centos"
	default["apache"]["package"] = "httpd"
when "ubuntu"
	default["apache"]["package"] = "apache2"
end
