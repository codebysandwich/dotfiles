local colors = require('ayu.colors')
colors.generate(true) -- Pass `true` to enable mirage

require('ayu').setup {
    mirage = true, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
	overrides = function()
    return { Comment = { fg = colors.comment } ,
	}
	end	
}

vim.cmd('colorscheme ayu-mirage')
vim.cmd('hi! link @preproc Comment')
