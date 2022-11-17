require'nvim-treesitter.configs'.setup {
    -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = { "c", "cpp", "java", "lua", "python", "vim", "go" },
    -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    auto_install = false,
    highlight = {
        enable = true,              -- false will disable the whole extension
		-- disable = { "python", "vim" },  -- list of language that will be disabled
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files

        disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			else
				ls = {"vim", "python"}
				for i = 0, #ls do
					if ls[i] == lang then
						return true
					end
				end
			end
		end,
        additional_vim_regex_highlighting = false,
    },
}
