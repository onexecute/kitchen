# Loops through the data bag items. loading into the data object.
#
search(:group, "*:*").each do |data|
	group data["id"] do
		gid data["gid"]
		members data["members"]
	end
end
