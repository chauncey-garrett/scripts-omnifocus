(*
	# DESCRIPTION #

	Stagger Dates takes the selected tasks and redistributes them one weekday at a time. For example, if it is Monday and you select 5 tasks and hit Stagger Dates, you’ll have one task on each day of the week. If it is Tuesday, then you’ll have 4 for this week and 1 on next Monday.

I use this when I plan a sequence of tasks (like all these blog posts) and want to only do one a day. I also use in when after a big reorg I have a ton of tasks on a single day. This quickly balances out tasks without having to edit them all by hand.
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

