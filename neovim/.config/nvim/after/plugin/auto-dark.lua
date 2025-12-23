require("auto-dark-mode").setup({
	set_dark_mode = function()
		vim.cmd("colorscheme github_dark_dimmed")
	end,
	set_light_mode = function()
		vim.cmd("colorscheme github_light_default")
	end,
	update_interval = 300,
	fallback = "dark",
})
