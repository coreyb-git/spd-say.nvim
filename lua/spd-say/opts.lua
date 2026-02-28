local numbers_lower = "-="
local numbers_upper = "!@#$%^&*()_+"
local symbols_lower = "[]\\`;',./"
local symbols_upper = '{}|~:"<>?'
local symbols_other = " \t"

--local symbols_all = numbers_lower .. numbers_upper .. symbols_lower .. symbols_upper .. symbols_other
local cursor_triggers_all = numbers_lower .. numbers_upper .. symbols_lower .. symbols_upper .. symbols_other

return {
	enabled = true,
	initial_pause_ms = 100,
	end_pause_ms = 100,
	speak_on_cursormoved = true,
	dont_repeat = true,
	speak_on_cursorholdi = false,
	triggers = " ,.])>;:?",
	triggers_under_cursor = cursor_triggers_all,
	keys = {
		toggle = "<leader>V", -- voice
	},
	spd_say_cmd = "spd-say",
	spd_say_flags = {
		cancel = "-C -S",

		ssml = "--ssml",
		pipe = "--pipe-mode",
		priority = "--priority text",
		punctuation_mode = "--punctuation-mode none",
		--voice = "--synthesis-voice en-US-NYC+Steph",
		voice = "",
		--wait = "--wait",
		wait = "",
	},
}
