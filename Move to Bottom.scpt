tell application "OmniFocus"
	tell content of document window 1 of default document
		set taskList to get value of selected trees
		repeat with aTask in taskList
			set theProject to containing project of aTask
			--move aTask to beginning of tasks of theProject
			move aTask to end of tasks of theProject
		end repeat
	end tell
end tell
