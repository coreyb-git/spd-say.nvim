local opts = require("spd-say.opts")
local utils = require("spd-say.utils")
local speak = require("spd-say.speak")

vim.keymap.set("n", opts.keys.toggle, utils.toggle, { desc = "[V]oice Reader Toggle (spd-say)" })

vim.keymap.set("i", "<CR>", function()
	local last_word = utils.get_prior_word()
	local last_char = last_word:sub(-1)
	if not utils.is_trigger_char(last_char) then
		speak.say(last_word)
	end

	return "<CR>" -- Neovim handles the conversion for you
end, { expr = true, buffer = true, replace_keycodes = true })
