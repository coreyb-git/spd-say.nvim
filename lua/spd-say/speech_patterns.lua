local opts = require("spd-say.opts")

local token_prefix = "TOKENTOKENTOKENTOKENTOKENTOKEN"

local function get_pause(ms)
	return "<break time ='" .. ms .. "ms'/>"
end

local token_short = token_prefix .. "shortpause"
local token_long = token_prefix .. "longpause"
local ssml_pause_short = get_pause(opts.speech_pause_ms.short)
local ssml_pause_long = get_pause(opts.speech_pause_ms.long)

local token_emphasis_start = token_prefix .. "emphasisstart"
local token_emphasis_end = token_prefix .. "emphasisend"
local ssml_emphasis_start = "<emphasis>"
local ssml_emphasis_end = "</emphasis>"

return {
	single_words = {
		{ "%-%-", "double dash" },
		{ "\\", "back slash" },

		{ "%.%.%.", "ellipsis" },
		{ "%.%.", "double stop" },

		-- number line
		{ "%-", "minus" },
		{ "=", "equals" },

		--upper number line
		{ "!", "bang" },
		{ "@", "at" },
		{ "#", "hash" },
		{ "%$", "dollar" },
		{ "%%", "percent" },
		{ "%^", "caret" },
		{ "&", "ampersand" },
		{ "%*", "star" },
		{ "%(", "left parens" },
		{ "%)", "right parens" },
		{ "%_", "under score" },
		{ "%+", "plus" },

		-- lower symbols
		{ "%[", "left bracket" },
		{ "%]", "right bracket" },
		{ "`", "back tick" },
		{ ";", "semicolon" },
		{ "%s+'", "quote" },
		{ "'%s+", "close single quote" },
		{ "%s+'%s+", "single quotation mark" },
		{ "%,", "comma" },
		{ "%.", "dot" },
		{ "/", "forward slash" },

		--upper symbols
		{ "{", "left brace" },
		{ "}", "right brace" },
		{ "|", "pipe" },
		{ "~", "tilde" },
		{ ":", "colon" },
		{ '(%S+)"', "%1 close quote" },
		{ '%s+"', "quote" },
		{ '%s+"%s+', "double quotation mark" },
		{ "<", "angle left" },
		{ ">", "angle right" },
		{ "%?", "question mark" },

		{ token_short, ssml_pause_short },
		{ token_long, ssml_pause_long },
		{ token_emphasis_start, ssml_emphasis_start },
		{ token_emphasis_end, ssml_emphasis_end },
	},

	normal_speech = {
		-- short-hand substitutions
		{ "i%.e%.", "that is" .. token_short },
		{ "e%.g%.", "for example" .. token_short },

		{ "%-%-", token_short },
		{ "%s+%-%s+", "dash" },
		{ "%s+-%s+", "minus" },
		{ "%-", " " }, -- hyphenated word?
		{ "\\", "back slash" },

		{ "%.%.%.", token_long },
		{ "%.%.", token_long },

		-- number line
		{ "=", "equals" },

		--upper number line
		{ "!", token_long },
		{ "@", "at" },
		{ "#", "hash" },
		{ "%$", "dollar" },
		{ "%%", "percent" },
		{ "%^", "caret" },
		{ "&", "and" },
		{ "%*", "star" },
		{ "%(", token_short },
		{ "%)", token_short },
		{ "%_", "" },
		{ "%+", "plus" },

		-- lower symbols
		{ "%[", "open bracket" },
		{ "%]", "close bracket" },
		{ "`", "back tick" },
		{ ";", token_short },
		{ "%s+'", "" },
		{ "'%s+", "" },
		{ "%s+'%s+", "single quotation mark" },
		{ "%,", token_short },
		{ "%.", token_long },
		{ "/", "slash" },

		--upper symbols
		{ "{", "open brace" },
		{ "}", "close brace" },
		{ "|", token_long },
		{ "~", "tilde" },
		{ ":%s+", token_short }, -- colon
		{ ":", "colon" },
		{ '"%s+', "" },
		{ '%s+"', "" },
		{ '%s+"%s+', "double quotation mark" },
		{ "<", "angle left" },
		{ ">", "angle right" },
		{ "%?", token_long },

		{ token_short, ssml_pause_short },
		{ token_long, ssml_pause_long },
		{ token_emphasis_start, ssml_emphasis_start },
		{ token_emphasis_end, ssml_emphasis_end },
	},

	code = {
		{ "function%(%)", "anonymous function" },
		{ "===", "is the same type and value as" },
		{ "==", "is equal to" },
		{ "!=", "is not equal to" },
		{ "~=", "is not equal to" },
		{ "=", "is assigned " },

		{ "%-%-", "double dash" },
		{ "\\", "back slash" },

		{ "%.%.%.", "ellipsis" },
		{ "%.%.", "double stop" },

		-- number line
		{ "%-", "minus" },
		{ "=", "equals" },

		--upper number line
		{ "!", "bang" },
		{ "@", "at" },
		{ "#", "hash" },
		{ "%$", "dollar" },
		{ "%%", "percent" },
		{ "%^", "caret" },
		{ "&", "ampersand" },
		{ "%*", "star" },
		{ "%(", "left parens" },
		{ "%)", "right parens" },
		{ "%_", "under score" },
		{ "%+", "plus" },

		-- lower symbols
		{ "%[", "left bracket" },
		{ "%]", "right bracket" },
		{ "`", "back tick" },
		{ ";", "semicolon" },
		{ "%s+'", "quote" },
		{ "'%s+", "close single quote" },
		{ "%s+'%s+", "single quotation mark" },
		{ "%,", "comma" },
		{ "%.", "dot" },
		{ "/", "forward slash" },

		--upper symbols
		{ "{", "left brace" },
		{ "}", "right brace" },
		{ "|", "pipe" },
		{ "~", "tilde" },
		{ ":", "colon" },
		{ '(%S+)"', "%1 close quote" },
		{ '%s+"', "quote" },
		{ '%s+"%s+', "double quotation mark" },
		{ "<", "angle left" },
		{ ">", "angle right" },
		{ "%?", "question mark" },

		{ token_short, ssml_pause_short },
		{ token_long, ssml_pause_long },
		{ token_emphasis_start, ssml_emphasis_start },
		{ token_emphasis_end, ssml_emphasis_end },
	},
}
