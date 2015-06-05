--
-- OmniFocus - test if there are items in the inbox
--

tell application "OmniFocus"
	tell default document
		if (count inbox tasks) > 0 then
			return 1
		else
			return 0
		end if
	end tell
end tell

