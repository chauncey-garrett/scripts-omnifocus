--
-- Copy task outline to clipboard
--

tell application "OmniFocus"
	tell first document window of front document
		set selectedItems to selected trees of content
		if ((count of selectedItems) < 1) then
			error "Please first select a task"
		end if
		set output to ""
		repeat with itemItr in selectedItems
			set output to output & my printTree(itemItr, 0)
		end repeat
	end tell
end tell
set the clipboard to output

on printTree(node, indent)
	set output to ""
	repeat indent times
		set output to output & "    "
	end repeat
	set output to output & name of node & (ASCII character 13)
	tell application "OmniFocus"
		repeat with treeItr in trees of node
			set treeItr to treeItr as any
			set output to output & my printTree(treeItr, indent + 1)
		end repeat
	end tell
	return output
end printTree
