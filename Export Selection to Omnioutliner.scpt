-- Illustrative draft Ver 0.5

-- Copies anything selected in Omnifocus (Project or Context View) into OmniOutliner
-- Including the following fields: DONE, NOTE, CONTEXT or PROJECT, START, DUE, COMPLETED, DURATION, FLAGGED}
-- Note that the whole sub-tree is copied, so only 'parent' elements need to be selected.
-- The destination is the currently open OmniOutliner document.
-- (A fresh OmniOutliner document is created if none is open)

property pPROJECT : "project"
property pTASK : "task"
property pINBX_TASK : "inbox task"
property pITEM : "item"

property pColProjContext : 3 as integer
property pSTART : 4 as integer
property pDUE : 5 as integer
property pCOMPLETED : 6 as integer
property pDURATION : 7 as integer
property pFLAGGED : 8 as integer

on run
	set {lstActivities, blnContext} to SelectedInOF()

	PlaceInOO(lstActivities, blnContext)
end run

-- PLACING IN OMNIOUTLINER

on PlaceInOO(lstTasks, blnContext)
	if (length of lstTasks > 0) then
		using terms from application "OmniOutliner Professional"
			set docTarget to MakeTaskDoc(blnContext)
			Tasks2OO(lstTasks, docTarget)
			tell docTarget to set expanded of every row to true
		end using terms from
	end if
end PlaceInOO

on Tasks2OO(lstTasks, oParent)
	using terms from application "OmniOutliner Professional"
		tell oParent
			repeat with oTask in lstTasks
				set {strName, blnDone, lstChiln, strNote, strProjContext, dteStart, dteDue, dteDone, lngMins, blnFlagged} to oTask

				if length of strNote > 0 then
					set recRow to {topic:strName, note:strNote, expanded:true}
				else
					set recRow to {topic:strName, expanded:true}
				end if
				if blnDone then set recRow to recRow & {state:checked}

				set oRow to make new row at end of children with properties recRow
				tell oRow
					if strProjContext is not missing value then set value of cell pColProjContext to strProjContext
					if dteStart is not missing value then set value of cell pSTART to dteStart
					if dteDue is not missing value then set value of cell pDUE to dteDue
					if blnDone then if (dteDone is not missing value) then set value of cell pCOMPLETED to dteDone
					if lngMins > 0 then set value of cell pDURATION to lngMins / 60
					if blnFlagged then set state of cell pFLAGGED to checked
				end tell

				if (length of lstChiln > 0) then my Tasks2OO(lstChiln, oRow)
			end repeat
		end tell
	end using terms from
end Tasks2OO

on MakeTaskDoc(blnContext)
	tell application "OmniOutliner Professional"
		activate
		set docTarget to make new document at before documents
		set oWin to front window
		set bounds of oWin to {0, 0, 1000, 500}
		-- Create required columns
		tell docTarget

			if blnContext then
				make new column with properties {type:rich text, name:"Project"}
			else
				make new column with properties {type:rich text, name:"Context"}
			end if
			make new column with properties {type:date, name:"Start"}
			make new column with properties {type:date, name:"Due"}
			make new column with properties {type:date, name:"Completed"}
			make new column with properties {type:duration, name:"Duration"}
			make new column with properties {type:checkbox, name:"Flagged", width:64}
		end tell
		return docTarget
	end tell
end MakeTaskDoc

-- READ SELECTED OmniFocus CONTENT TREE(S) TO NESTED APPLESCRIPT LISTS - Ver.02

on SelectedInOF()
	tell application "OmniFocus"
		set oWin to front window
		set blnContext to ((selected view mode identifier) of oWin is not equal to pPROJECT)
		tell content of oWin
			set lstContentSeln to selected trees
			if (count of lstContentSeln) > 0 then -- Whatever is SELECTED in content panel
				set lstTrees to lstContentSeln
				set blnAll to false
			else -- EVERYTHING in the content panel
				set lstTrees to trees
				set blnAll to true
			end if
		end tell
		{my Trees2List(oWin, lstTrees, blnContext, blnAll), blnContext}
	end tell
end SelectedInOF

on Trees2List(oWin, lstTrees, blnContext, blnAll)
	set lstTasks to {}

	using terms from application "OmniFocus"
		repeat with oNode in lstTrees
			set oValue to value of oNode
			set cClass to class of oValue

			if cClass is not item then
				if cClass is project then
					set end of lstTasks to my ListProject(oNode, oValue, blnContext, blnAll)
				else
					set end of lstTasks to my ListContext(oNode, oValue, blnAll)
				end if
			else
				set end of lstTasks to my ListUnProcessed(oNode, oValue, blnContext, blnAll)
			end if
		end repeat
	end using terms from
	lstTasks
end Trees2List

on ListProject(oNode, oValue, blnContext, blnAll)
	using terms from application "OmniFocus"
		tell oNode
			set lstChildren to trees of oNode
			tell oValue
				if (count of lstChildren) > 0 then
					{name, completed, my ListSubTrees(lstChildren, blnContext, blnAll), note, "", start date, due date, completion date, estimated minutes, flagged}
				else
					{name, completed, {}, note, "", start date, due date, completion date, estimated minutes, flagged}
				end if
			end tell
		end tell
	end using terms from
end ListProject

on ListContext(oNode, oValue, blnAll)
	using terms from application "OmniFocus"
		tell oNode
			set lstChildren to trees
			set oValue to value of oNode
			tell oValue
				if (count of lstChildren) > 0 then
					{name, false, my ListSubTrees(lstChildren, true, blnAll), note, "", missing value, missing value, missing value, 0, false}
				else
					{name, false, {}, note, "", missing value, missing value, missing value, 0, false}
				end if
			end tell
		end tell
	end using terms from
end ListContext


on ListUnProcessed(oNode, oValue, blnContext, blnAll)
	using terms from application "OmniFocus"
		tell oNode
			set lstChildren to trees

			if blnContext then
				set strName to "No Context"
			else
				set strName to "Inbox"
			end if

			tell oValue
				if (count of lstChildren) > 0 then
					{strName, false, my ListSubTrees(lstChildren, blnContext, blnAll), "", "", missing value, missing value, missing value, 0, false}
				else
					{strName, false, {}, "", "", missing value, missing value, missing value, 0, false}
				end if
			end tell
		end tell
	end using terms from
end ListUnProcessed

on ListSubTrees(lstTrees, blnContext, blnAll)
	set lstTasks to {}
	repeat with oNode in lstTrees
		set end of lstTasks to my ListTask(oNode, blnContext, blnAll)
	end repeat
	return lstTasks
end ListSubTrees

on ListTask(oNode, blnContext, blnAll)
	using terms from application "OmniFocus"
		tell oNode
			set oTask to value of oNode
			set lstSubTrees to trees of oNode

		end tell
		if blnContext then
			set oParent to containing project of oTask
		else
			set oParent to context of oTask
		end if
		if oParent is not missing value then
			set strParent to name of oParent
		else
			set strParent to ""
		end if
		tell oTask
			if (count of lstSubTrees) > 0 then
				{name, completed, my ListSubTrees(lstSubTrees, blnContext, blnAll), note, strParent, start date, due date, completion date, estimated minutes, flagged}
			else
				{name, completed, {}, note, strParent, start date, due date, completion date, estimated minutes, flagged}
			end if
		end tell
	end using terms from
end ListTask

