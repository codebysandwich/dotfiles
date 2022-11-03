local treesitter = require('nvim-treesitter')
local function treelocation()
  return treesitter.statusline({
    indicator_size = 70,
    type_patterns = {'class', 'function', 'method'},
    separator = ''
  })
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 300,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'diff', {'branch', icon = {'', align='left'}}, {'diagnostics', source = {'coc'}}},
    --lualine_c = {'filename', {treelocation}},
	lualine_c = {{'filename', path=1, color={fg='#98C37A'},
          symbols = {
            modified = '[+]',      -- Text to show when the file is modified.
            readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
            unnamed = '[No Name]', -- Text to show for unnamed buffers.
            newfile = '[New]',     -- Text to show for new created file before first writting
          }}, 
		  {'g:coc_status', color={fg='#97C379', gui='bold'}},
	  },
    lualine_x = {{'encoding'}, 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
