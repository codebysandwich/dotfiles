return {
	'nvim-lualine/lualine.nvim',
	dependencies = { {'nvim-tree/nvim-web-devicons'} },
	config = function()
		local custom_dark = require'lualine.themes.onedark'
		-- local custom_dark = require'lualine.themes.ayu'
		-- local custom_dark = require'lualine.themes.sonokai'

		local colors = {
			bg = '#272C34',
			inactive_bg = '#3e4452',
			status_fg = '#97C379'
			-- bg = '#1F252E',
		}
		local get_color = require'lualine.utils.utils'.extract_highlight_colors

		-- Change the background of lualine_c section for normal mode
		custom_dark.normal.c.bg = colors.bg
		custom_dark.inactive.c.bg = colors.inactive_bg

		local function diff_source()
			local gitsigns = vim.b.gitsigns_status_dict
			if gitsigns then
				return {
					added = gitsigns.added,
					modified = gitsigns.changed,
					removed = gitsigns.removed
				}
			end
		end
		local treesitter = require('nvim-treesitter')
		-- use treesitter parse
		local function treelocation()
			return treesitter.statusline({
				indicator_size = 70,
				type_patterns = {'class', 'function', 'method'},
				separator = ''
			})
		end

		local function breadcrumbs()
		  local filename = vim.fn.expand('%:t')
		  local icon, color = require('nvim-web-devicons').get_icon_color(filename)
		  vim.cmd('hi WinbarFileIcon guifg=' .. color)
		  local items = vim.b.coc_nav
		  local t = {'%#WinbarFileIcon#' .. icon .. ' %#Normal#' .. filename}
		  for k,v in ipairs(items) do
			t[#t+1] = '%#String#' .. '' .. '%#' .. v.highlight .. '#' .. (v.label and v.label .. ' ' or '') .. v.name
		  end
		  return table.concat(t)
		end

		function split(input, delimiter)
			local arr = {}
			string.gsub(input, '[^' .. delimiter ..']+', function(w) table.insert(arr, w) end)
			return arr
		end

		local function get_venv()
			local venv = vim.env.VIRTUAL_ENV
			if venv then
				local params = split(venv, '/')
				return '(env:'..params[table.getn(params)-1]..')'
			else
				return ''
			end
		end
		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = custom_dark,
				component_separators = { left = '', right = ''},
				section_separators = { left = '', right = ''},
				-- section_separators = { left = '', right = ''},
				disabled_filetypes = { "dashboard", "NvimTree", "vista", winbar={'vim'}},
				ignore_focus = {"NvimTree", "vista"},
				refresh = { statusline = 300, winbar = 300 }
			},
			sections = {
				lualine_a = {'mode'},
				lualine_b = {{'diff', source=diff_source, symbols = { added = ' ', modified = '柳', removed = ' ' },}, 
							 -- {'branch', icon = {'', align='left'}}, 
							 {'b:gitsigns_head', icon = ''},
							 {'diagnostics', source = {'coc'},
							  symbols = { error = ' ', warn = ' ', info = ' ' },
							  diagnostics_color = {
								  error = {fg = get_color('CocErrorSign', 'fg')},
								  warn = {fg = get_color('CocWarningSign', 'fg')},
								  info = {fg = get_color('CocInfoSign', 'fg')},
							  },
							 },
							},
				--lualine_c = {'filename', {treelocation}},
				lualine_c = {{function()
						 local fg = colors.status_fg -- not modified
						 if vim.bo.modified then fg = '#FA4933' -- unsaved
						 elseif not vim.bo.modifiable then fg = '#56B6C3' end -- readonly
						 vim.cmd('hi! lualine_filename_status guibg='..colors.bg..' guifg='..fg)
						 --equal path=1
						 return vim.fn.expand('%:~:.')..'%m'
						 end,
						 color = 'lualine_filename_status',
						 },
						 -- {"%{coc#status()} ", color={fg='#97C379', gui='bold'}}, -- diagnostics + status
						 -- {breadcrumbs},
						 {'g:coc_status', color={fg=colors.status_fg, gui='bold'}}, 
						 -- {"%{get(b:,'coc_current_function','')}", color={fg='#6699cc', gui='bold'}},
						 {'b:coc_current_function', color={fg='#6699cc', gui='bold'}},
						},

				lualine_x = {{get_venv, color={fg=colors.status_fg, gui='bold'}}, 
							 'filetype', {'fileformat', symbols = {unix = '勇[unix]'}}, 'encoding'},
				lualine_y = {'progress'},
				lualine_z = {'location'}
			  },
		  inactive_sections = {
			  lualine_a = {},
			  lualine_b = {},
			  lualine_c = {{'filename', path=1},},
			  lualine_x = {'filetype', {'fileformat', symbols = {unix = '勇[unix]'}}, 
						 'encoding', 'progress', 'location'},
			  lualine_y = {},
			  lualine_z = {}
		  },
		  winbar = {
			  lualine_c = {breadcrumbs}
		  },
		  inactive_winbar = {
			  lualine_c = {breadcrumbs}
		  },
		  tabline = {},
		  extensions = {}
		}
	end
}
