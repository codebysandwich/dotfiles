-- WARN: test
-- NOTE: test
-- TODO: test
-- HACK: test
-- PERF: test
-- FIX: test
require("todo-comments").setup({
	keywords = {
		TODO = { icon = " ", color = "warning" },
		HACK = { icon = " ", color = "info" },
		WARN = {icon = " ", color = "warning", alt = { "WARNING", "XXX" }},
	},
	highlight = {
		multiline = false,
	}
})
