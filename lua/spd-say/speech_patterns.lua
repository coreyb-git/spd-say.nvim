local opts = require("spd-say.opts")

local function get_pause(ms)
	return "<break time ='" .. ms .. "ms'/>"
end

local ssml_pause_short = get_pause(opts.speech_pause_ms.short)
local ssml_pause_long = get_pause(opts.speech_pause_ms.long)

local token_short = "TOKENTOKENTOKENTOKENTOKENTOKENSHORT"
local token_long = "TOKENTOKENTOKENTOKENTOKENTOKENLONG"

return {
	single_words = {
		{ "%-%-",    "double dash" },
		{ "\\",      "back slash" },

		{ "%.%.%.",  "ellipsis" },
		{ "%.%.",    "double stop" },

		-- number line
		{ "%-",      "minus" },
		{ "=",       "equals" },

		--upper number line
		{ "!",       "bang" },
		{ "@",       "at" },
		{ "#",       "hash" },
		{ "%$",      "dollar" },
		{ "%%",      "percent" },
		{ "%^",      "caret" },
		{ "&",       "and" },
		{ "%*",      "star" },
		{ "%(",      "left parens" },
		{ "%)",      "right parens" },
		{ "%_",      "under score" },
		{ "%+",      "plus" },

		-- lower symbols
		{ "%[",      "left bracket" },
		{ "%]",      "right bracket" },
		{ "`",       "back tick" },
		{ ";",       "semicolon" },
		{ "%s+'",    "quote" },
		{ "'%s+",    "close single quote" },
		{ "%s+'%s+", "single quotation mark" },
		{ "%,",      "comma" },
		{ "%.",      "dot" },
		{ "/",       "forward slash" },

		--upper symbols
		{ "{",       "left brace" },
		{ "}",       "right brace" },
		{ "|",       "pipe" },
		{ "~",       "tilde" },
		{ ":",       "colon" },
		{ '(%S+)"',  "%1 close quote" },
		{ '%s+"',    "quote" },
		{ '%s+"%s+', "double quotation mark" },
		{ "<",       "angle left" },
		{ ">",       "angle right" },
		{ "%?",      "question mark" },
	},

	normal_speech = {
		{ "%-%-",      "double dash" },
		{ "\\",        "back slash" },

		{ "%.%.%.",    "ellipsis" },
		{ "%.%.",      "double stop" },

		-- number line
		{ "%-",        "minus" },
		{ "=",         "equals" },

		--upper number line
		{ "!",         "bang" .. token_long },
		{ "@",         "at" },
		{ "#",         "hash" },
		{ "%$",        "dollar" },
		{ "%%",        "percent" },
		{ "%^",        "caret" },
		{ "&",         "and" },
		{ "%*",        "star" },
		{ "%(",        "left parens" },
		{ "%)",        "right parens" },
		{ "%_",        "under score" },
		{ "%+",        "plus" },

		-- lower symbols
		{ "%[",        "left bracket" },
		{ "%]",        "right bracket" },
		{ "`",         "back tick" },
		{ ";",         "semicolon" },
		{ "%s+'",      "quote" },
		{ "'%s+",      "close single quote" },
		{ "%s+'%s+",   "single quotation mark" },
		{ "(%S+),",    "%1" .. token_short },
		{ "(%S+)%.",   "%1" .. token_long },
		{ "%,",        "comma" },
		{ "%.",        "dot" },
		{ "/",         "forward slash" },

		--upper symbols
		{ "{",         "left brace" },
		{ "}",         "right brace" },
		{ "|",         "pipe" },
		{ "~",         "tilde" },
		{ ":",         "colon" },
		{ '(%S+)"',    "%1 close quote" },
		{ '%s+"',      "quote" },
		{ '%s+"%s+',   "double quotation mark" },
		{ "<",         "angle left" },
		{ ">",         "angle right" },
		{ "%?",        "question mark" .. token_long },

		{ token_short, ssml_pause_short },
		{ token_long,  ssml_pause_long },
	},

	code = {
		{ "function%(%)", "anonymous function"},
		{ "==", "is equal to"},
		{ "!=", "is not equal to"},
		{ "~=", "is not equal to"},
		{ "=", "is assigned "},

		{ "%-%-",      "double dash" },
		{ "\\",        "back slash" },

		{ "%.%.%.",    "ellipsis" },
		{ "%.%.",      "double stop" },

		-- number line
		{ "%-",        "minus" },
		{ "=",         "equals" },

		--upper number line
		{ "!",         "bang"},
		{ "@",         "at" },
		{ "#",         "hash" },
		{ "%$",        "dollar" },
		{ "%%",        "percent" },
		{ "%^",        "caret" },
		{ "&",         "and" },
		{ "%*",        "star" },
		{ "%(",        "left parens" },
		{ "%)",        "right parens" },
		{ "%_",        "under score" },
		{ "%+",        "plus" },

		-- lower symbols
		{ "%[",        "left bracket" },
		{ "%]",        "right bracket" },
		{ "`",         "back tick" },
		{ ";",         "semicolon" },
		{ "%s+'",      "quote" },
		{ "'%s+",      "close single quote" },
		{ "%s+'%s+",   "single quotation mark" },
		{ "%,",        "comma" },
		{ "%.",        "dot" },
		{ "/",         "forward slash" },

		--upper symbols
		{ "{",         "left brace" },
		{ "}",         "right brace" },
		{ "|",         "pipe" },
		{ "~",         "tilde" },
		{ ":",         "colon" },
		{ '(%S+)"',    "%1 close quote" },
		{ '%s+"',      "quote" },
		{ '%s+"%s+',   "double quotation mark" },
		{ "<",         "angle left" },
		{ ">",         "angle right" },
		{ "%?",        "question mark"},

		{ token_short, ssml_pause_short },
		{ token_long,  ssml_pause_long },
	},
}
