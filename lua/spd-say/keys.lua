local opts = require("spd-say.opts")
local utils = require("spd-say.utils")
local speak = require("spd-say.speak")
local pronunciation = require("spd-say.pronunciation")

vim.keymap.set("n", opts.keys.toggle, "<cmd>SpdSayToggle<cr>", { desc = "[V]oice Reader Toggle (spd-say)" })

local function bind_carriage_return()
	vim.keymap.set("i", "<CR>", function()
		local last_word = utils.get_prior_word()
		local last_char = last_word:sub(-1)
		if not utils.is_trigger_char(last_char, opts.triggers) then
			speak.say(last_word, pronunciation.words)
			vim.notify("debug")
		end

		return "<CR>" -- vim handles the conversion for you
	end, {
		expr = true,
		buffer = 0,
		replace_keycodes = true,
	})
end

-- re-assert carriage return dominance, instead of allowing other plugins
-- to globally steal it.
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = bind_carriage_return,
})
