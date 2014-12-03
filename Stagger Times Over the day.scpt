(*
	# DESCRIPTION #
	
	Stagger Times does the same thing as Stagger Dates, but for a single day. It takes the selected tasks and reschedules each task to start at the end of the previous task based on the previous due time and the estimated time of the task.

This lets me throw everything to a single day (which will use the default due time) and then spread them out throughout the day. If the tasks go too late, I know I’ve bit off more than I can chew for that day.

*)


property defaultStartTime : 15 --default time to use (in hours, 24-hr clock)

tell application "OmniFocus"
	set will autosave of front document to false
	
	tell content of front document window of front document
		set validSelectedItemsList to value of (selected trees where class of its value is not item and class of its value is not folder)
		set firstTask to value of first item of selected trees
		set timestamp to due date of firstTask
		
		repeat with thisItem in validSelectedItemsList
			set due date of thisItem to timestamp
			set forward_time to estimated minutes of thisItem
			if forward_time is missing value then
				set forward_time to 15
			end if
			set timestamp to timestamp + (forward_time * 60)
		end repeat
	end tell
	
	set will autosave of front document to true
end tell
