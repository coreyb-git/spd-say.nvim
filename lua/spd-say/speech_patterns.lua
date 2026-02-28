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
		{ "&",       "ampersand" },
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
		{ "%-%-",      token_short },
		{ "%s+%-%s+",      "dash" },
		{ "%s+-%s+",      "minus" },
		{ "%-",      " " },  -- hyphenated word?
		{ "\\",        "back slash" },

		{ "%.%.%.",    "ellipsis" },
		{ "%.%.",      "double stop" },

		-- number line
		{ "=",         "equals" },

		--upper number line
		{ "!",         token_long },
		{ "@",         "at" },
		{ "#",         "hash" },
		{ "%$",        "dollar" },
		{ "%%",        "percent" },
		{ "%^",        "caret" },
		{ "&",         "and" },
		{ "%*",        "star" },
		{ "%(",        "open parens" },
		{ "%)",        "close parens" },
		{ "%_",        "under score" },
		{ "%+",        "plus" },

		-- lower symbols
		{ "%[",        "open bracket" },
		{ "%]",        "close bracket" },
		{ "`",         "back tick" },
		{ ";",         "semicolon" },
		{ "%s+'",      token_short },
		{ "'%s+",      token_short },
		{ "%s+'%s+",   "single quotation mark" },
		{ "%,",        token_short },
		{ "%.",        token_long },
		{ "/",         "slash" },

		--upper symbols
		{ "{",         "open brace" },
		{ "}",         "open brace" },
		{ "|",         token_long },
		{ "~",         "tilde" },
		{ ":%s+",         token_short },  -- colon
		{ ":",         "colon"},
		{ '(%S+)"',    "%1" .. token_short },
		{ '%s+"',      token_short },
		{ '%s+"%s+',   "double quotation mark" },
		{ "<",         "angle left" },
		{ ">",         "angle right" },
		{ "%?",        token_long },

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
		{ "&",         "ampersand" },
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
