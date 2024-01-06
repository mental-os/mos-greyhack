//command: ls

computer = get_shell.host_computer
folderPath = current_path
if params and params[params.len - 1].indexOf("-") == null then
	folderPath = params[params.len - 1]
end if
	
folder = computer.File(folderPath)
if folder == null then
	print("\n<color=#FE5000>" + active_user() + "</color> running <color=#FE5000>Echanced LS</color>\nNo such file or directory\n")
else
	if not folder.has_permission("r") then
		print("\n<color=#FE5000>" + active_user() + "</color> running <color=#FE5000>Echanced LS</color>\n<color=red>Permission denied</color> for " + active_user() + " \n")
	else
		subFiles = folder.get_folders + folder.get_files
		output = ""
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
			output = output + ">> " + nameFile + " " + type + " " + permission + " " + owner + " " + group + " " + size
		end for
		print("\n<color=#FE5000>" + active_user() + "</color> running <color=#FE5000>Echanced LS</color>\n<color=white>" + count + " results</color> as content of: <color=white>" + folderPath + "</color>\n")
		print(format_columns(output)+"\n")
	end if
end if
