local numbers_lower = "-="
local numbers_upper = "!@#$%^&*()_+"
local symbols_lower = "[]\\`;',./"
local symbols_upper = '{}|~:"<>?'
local symbols_other = " \t"

--local symbols_all = numbers_lower .. numbers_upper .. symbols_lower .. symbols_upper .. symbols_other
local word_stops_all = numbers_lower .. numbers_upper .. symbols_lower .. symbols_upper .. symbols_other

return {
	enabled = true,
	auto_set_patterns = true,

	events = {
		finished_typing_word = true,

		cursor_onto = {
			word = true,
			sentence = true,
			line = true, -- whole paragraph
		},
	},

	typing_triggers = " ,.])>;:?",

	sentence_stops = ".!?",
	word_stops = word_stops_all,

	keys = {
		toggle = "<leader>V", -- voice
	},

	speech_pause_ms = {
		before = 10,
		after = 100,
		short = 250,
		long = 750,
	},

	respeak_delay_ms = 100, -- how long to wait after stopping prior speech.

	spd_say_cmd = "spd-say",
	spd_say_flags = {
		cancel = "-S",

		rate_ms = "",
		pitch = "",
		synthesis_voice = '--synthesis-voice "English (Great Britain)+Mr_Serious"',
		--	synthesis_voice = "",

		ssml = "--ssml",
		pipe = "--pipe-mode",
		priority = "--priority text",
		punctuation_mode = "--punctuation-mode none",
		wait = "",
	},
}
