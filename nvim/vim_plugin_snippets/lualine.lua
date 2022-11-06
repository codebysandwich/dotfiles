local custom_dark = require'lualine.themes.onedark'

local colors = {
  bg       = '#272C34',
}

-- Change the background of lualine_c section for normal mode
custom_dark.normal.c.bg = colors.bg

local treesitter = require('nvim-treesitter')
-- use treesitter parse
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
	--theme = 'onedark',
	theme = custom_dark,
    --theme = {
    --  -- We are going to use lualine_c an lualine_x as left and
    --  -- right section. Both are highlighted by c theme .  So we
    --  -- are just setting default looks o statusline
    --  normal = { c = { bg = '#202328' } },
    --  inactive = { c = { bg = '#202328' } },
    --},
    component_separators = { left = '', right = ''},
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
    lualine_b = {{'diff', symbols = { added = ' ', modified = '柳', removed = ' ' },}, 
				 {'branch', icon = {'', align='left'}}, 
				 {'diagnostics', source = {'coc'},
				  symbols = { error = ' ', warn = ' ', info = ' ' },
				 }
				},
	--lualine_c = {'filename', {treelocation}},
	lualine_c = {{function()
			     local fg = '#98C37A' -- not modified
			     if vim.bo.modified then fg = '#FA4933' -- unsaved
			     elseif not vim.bo.modifiable then fg = '#EF616E' end -- readonly
			     vim.cmd('hi! lualine_filename_status guibg='..colors.bg..' guifg='..fg)
				 --equal path=1
				 return vim.fn.expand('%:~:.')..'%m'
			     end,
				 color = 'lualine_filename_status',
				},
				 {'g:coc_status', color={bg=colors.bg, fg='#97C379', gui='bold'}},
				},

    lualine_x = {'filetype', {'fileformat', symbols = {unix = '勇[unix]'}}, 'encoding'},
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
