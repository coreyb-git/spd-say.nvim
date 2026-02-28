local numbers_lower = "1234567890-="
local numbers_lower = "-="
local numbers_upper = "!@#$%^&*()_+"
local symbols_lower = "[]\\`;',./"
local symbols_lower = "[]\\`;,./"
local symbols_upper = '{}|~:"<>?'
local symbols_upper = "{}|~:<>?"
local symbols_other = " "

local symbols_all = numbers_lower .. numbers_upper .. symbols_lower .. symbols_upper .. symbols_other

local triggers = " ,."

return {
	enabled = true,
	initial_pause_ms = 200,
	speak_symbols = true,
	speak_on_cursorhold = false,
	speak_on_characters = triggers,
	keys = {
		toggle = "<leader>V", -- voice
	},
	spd_say_opts = "--ssml --wait --punctuation-mode none",
	pronunciation = {
		["%-%-"] = "double dash",
		["\\"] = "back slash",

		["%.%.%."] = "ellipsis",
		["%.%."] = "double stop",

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
		["%s'"] = "quote",
		["'%s"] = "close single quote",
		["%s'%s"] = "single quotation mark",
		[",%s"] = "comma",
		["%.$s "] = "full stop",
		["%."] = "dot",
		["/"] = "forward slash",

		--upper symbols
		["{"] = "left brace",
		["}"] = "right brace",
		["|"] = "pipe",
		["~"] = "tilde",
		[":"] = "colon",
		['"%s'] = "close quote", -- important
		['%s"'] = "open quote", -- important
		['%s"%s'] = "double quotation mark", -- important
		["<"] = "angle left",
		[">"] = "angle right",
		["%?"] = "question mark",
	},
}
