--- @sync entry
-- (the line above must stay first: it makes yazi run this in the UI thread, where cx exists)
-- Enter: go into a folder, open a file (yazi's default opens folders in $EDITOR)
return {
	entry = function()
		local h = cx.active.current.hovered
		if h and h.cha.is_dir then
			ya.emit("enter", {})
		else
			ya.emit("open", {})
		end
	end,
}
