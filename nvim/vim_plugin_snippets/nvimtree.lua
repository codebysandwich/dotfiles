-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup{
	disable_netrw = false,
	-- open_on_setup = false, -- when drop rnvimr reuse this
	ignore_buffer_on_setup = false,
	view = {
		mappings = {
			list = {
				{ key = "i", action = "toggle_file_info" },
				-- { key = "<space>", action = "preview" }, -- will enused in extended keys
			},
		},
	},
	git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        timeout = 400,
    },
	diagnostics = {
		enable = true,
		show_on_dirs = true,
	},
	renderer = {
		highlight_opened_files = "name",
        indent_markers = {
          enable = true,
		},
		icons = {
			glyphs = {
				git = {
					untracked = '?',
					deleted = '𝐃',
				},
			},
		},
	},
	actions = {
		file_popup = {
            open_win_config = {
				border = "none",
            },
        },
	},
	-- disable open folder actived
	hijack_directories = {
		  enable = true,
		  auto_open = true,
    },
}


-- keymap
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>t", "<Cmd>NvimTreeToggle<CR>", opts)
