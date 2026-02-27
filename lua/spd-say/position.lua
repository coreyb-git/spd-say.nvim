local M = {}

M.start = {
	column = 123456789,
	row = 123456789,
}

M.latest = {
	column = 123456789,
	row = 123456789,
}

M.get_cursor = function()
	local cursor = vim.api.nvim_win_get_cursor(0)
	if not cursor then
		vim.notify(".. nil cursor..")
	end
	return {
		column = cursor[2],
		row = cursor[1],
	}
end

M.set = function(column, row)
	M.start.column = column
	M.start.row = row
end

M.reset = function()
	M.start = M.get_cursor()
	M.latest = M.get_cursor()
end

M.update_latest = function()
	M.latest = M.get_cursor()
end

M.is_new_line = function()
	local cursor = M.get_cursor()
	if M.start.row ~= cursor.row then
		return true
	end

	return false
end

return M
