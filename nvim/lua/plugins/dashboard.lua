return {
	{
		'glepnir/dashboard-nvim',
		dependencies = { {'nvim-tree/nvim-web-devicons'} },
		event = 'VimEnter',
		config = function()
			vim.cmd([[
				hi DashboardHeader guifg=#FFAA02
				hi DashboardFooter guifg=#F39939
				hi DashboardProjectIcon guifg=#FFAA02
				hi DashboardProjectTitleIcon guifg=#07A5A9
				hi DashboardProjectTitle guifg=#1C81D9
				hi DashboardMruIcon guifg=#07A5A9
				hi DashboardMruTitle guifg=#1C81D9
			]])
			require('dashboard').setup({
				theme = 'hyper',
				change_to_vcs_root = true,
				config = {
				  week_header = {
				   enable = true,
				  },
				  shortcut = {
					{ desc = ' NewFile', group = '@function', action = 'enew', key = 'n' },
					{ desc = ' Update', group = '@property', action = 'PlugUpdate', key = 'u' },
					{
					  icon = ' ',
					  icon_hl = '@character.special',
					  desc = 'Files',
					  group = 'Label',
					  action = 'Telescope find_files',
					  key = 'f',
					},
					{
					  desc = ' Apps',
					  group = 'DiagnosticInfo',
					  action = 'Telescope app',
					  key = 'a',
					},
					{
					  desc = ' Quit',
					  group = '@keyword',
					  action = 'q',
					  key = 'q',
					},
				  },
				  packages = { enable = true},
				}, 
			})
		end
	}
}
