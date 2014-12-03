-- Copy OmniFocus Item URI to Clipboard
--
-- Written by CAPH TECH
-- http://tech.caph.jp/2010/10/04/omnifocusとevernoteを?携させるapplescript/
--

tell front window of application "OmniFocus"
	try
		set theTrees to selected trees of content
		
		if (count of theTrees) < 1 then
			set theTrees to selected trees of sidebar
		end if
		
		if (count of theTrees) < 1 then
			return
		end if
		
		set theSelection to value of item 1 of theTrees
		
		if class of theSelection is folder then
			set the clipboard to "omnifocus:///folder/" & id of theSelection
		else if class of theSelection is project then
			set the clipboard to "omnifocus:///project/" & id of theSelection
		else
			set the clipboard to "omnifocus:///task/" & id of theSelection
		end if
	end try
end tell
