local function say(text)
	-- 'os.execute' sends the word to the Linux speech engine in the background
	os.execute("spd-say '" .. text .. "' &")
end

local function setup_keys()
	vim.keymap.set("i", "<space>", function()
		if vim.bo.buftype == "" then
			local line = vim.api.nvim_get_current_line()
			local col = vim.api.nvim_win_get_cursor(0)[2]
			local word = line:sub(1, col):match("(%w+)$")

			if word then
				say(word)
			end
		end

		return "<space>"
	end, { expr = true })
end

setup_keys()
