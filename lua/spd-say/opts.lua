local numbers_lower = "1234567890-="
local numbers_lower = "-="
local numbers_upper = "!@#$%^&*()_+"
--local symbols_lower = "[]\\`;',./"
local symbols_lower = "[]\\`;,./"
--local symbols_upper = '{}|~:"<>?'
local symbols_upper = '{}|~:<>?'
local symbols_other = " "

local symbols_all = numbers_lower .. numbers_upper .. symbols_lower .. symbols_upper .. symbols_other

return {
	enabled = true,
	initial_pause_ms = 0,
	speak_symbols = true,
	speak_on_cursorhold = false,
	speak_on_characters = symbols_all,
	keys = {
		toggle = "<leader>V", -- voice
	},
	spd_say_opts = "--ssml --wait --punctuation-mode none",
	pronunciation = {
		["%-%-"] = "double dash",
		["\\"] = "back slash", 

		["%.%.%."] = "ellipsis",
		["%.%."] = "double stop",
		["%-%-"] = "double dash",

		-- number line
		["%-"] = "minus",
		["="] = "equals",

		--upper number line
		["!"] = "bang",
		["@"] = "at",
		["#"] = "hash",
		["%$"] = "dollar",
		["%%"] = "percent",
		["%^"] = "caret",
		["&"] = "and",
		["%*"] = "star",
		["%("] = "left parens",
		["%)"] = "right parens",
		["%_"] = "under score",
		["%+"] = "plus",

		-- lower symbols
		["%["] = "left bracket",
		["%]"] = "right bracket",
		["`"] = "back tick",
		[";"] = "semicolon",
		["%s'"] = "open single quote",
		["' "] = "close single quote",
		["%s' "] = "single quote",
		[","] = "comma",
		["%. "] = "full stop",
		["%."] = "dot",
		["/"] = "forward slash",

		--upper symbols
		["{"] = "left brace",
		["}"] = "right brace",
		["|"] = "pipe",
		["~"] = "tilde",
		[":"] = "colon",
		['%s"'] = "open quote", -- important
		['" '] = "close quote", -- important
		['"'] = "quote", -- important
		["<"] = "angle left",
		[">"] = "angle right",
		["%?"] = "question mark",
	},
}
