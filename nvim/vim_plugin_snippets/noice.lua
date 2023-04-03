require("noice").setup({
	-- Display the Cmdline and Popupmenu Together
	views = {
      cmdline_popup = {
        position = {
          row = 13,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = 16,
          col = "50%",
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      },
    },
	cmdline = {
		format = {
			search_down = { kind = "search", pattern = "^/", icon = " /", lang = "regex" },
			search_up = { kind = "search", pattern = "^%?", icon = " ?", lang = "regex" },
		}
	},
	-- Show as a notify message
	routes = {
      {
        filter = {
          event = "notify",
          min_height = 15
        },
        view = 'split',
      },
    },
})

