//command: ls
//enchanced by @mental.os
//version 1.0

computer = get_shell.host_computer
folderPath = current_path
if params and params[params.len - 1].indexOf("-") == null then
	folderPath = params[params.len - 1]
end if

introText = "\n<color=#FE5000>" + active_user() + "</color> running <color=#FE5000>Echanced LS 1.0</color>\n"

string.color = function(hex)
	return "<color=" + hex + ">" + self + "</color>"
end function

folder = computer.File(folderPath)
if folder == null then
	print(introText + "No such file or directory\n")
else
	if not folder.has_permission("r") then
		print(introText + "<color=red>Permission denied</color> for " + active_user() + " \n")
	else
		subFiles = folder.get_folders + folder.get_files
		output = "- NAME TYPE PERMS OWNER GROUP SIZE"
		type = ""
		count = 0
		for subFile in subFiles
			nameFile = subFile.name
			permission = subFile.permissions
			owner = subFile.owner
			size = subFile.size
			group = subFile.group
			count = count + 1
			if subFile.is_folder() then
				type = "[F]"
			else
				type = "[f]"
			end if
			if output.len > 0 then 
				output = output + "\n"
			end if
			output = output + count + ". " + nameFile + " " + type + " " + permission + " " + owner + " " + group + " " + size
		end for
		print(introText + "<color=white>" + count + " results</color> as content of <color=white>" + folderPath + "</color>\n")
		print(format_columns(output)+"\n")
	end if
end if
