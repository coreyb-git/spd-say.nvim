return {
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
	{ "&", "and" },
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
	{ "(%S+),", "%1" },
	{ "(%S+)%.", "%1" },
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
}
