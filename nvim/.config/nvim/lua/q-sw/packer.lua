vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	-- Color scheme
	use({
		"projekt0n/github-nvim-theme",
		config = function()
			vim.cmd("colorscheme github_dark_dimmed")
		end,
	})
	-- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v4.x",
		requires = {
			{ "williamboman/mason.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "mfussenegger/nvim-dap" },
			{ "rcarriga/nvim-dap-ui" },
			{ "nvim-neotest/nvim-nio" },
			{ "jay-babu/mason-nvim-dap.nvim" },
			{ "mfussenegger/nvim-lint" },
			{ "stevearc/conform.nvim" },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },

			-- AUTO COMPLETE
			--
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/nvim-cmp" },

			-- SNIPPSET
			{ "hrsh7th/cmp-vsnip" },
			{ "hrsh7th/vim-vsnip" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	-- Tree Sitter
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	-- Git
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")

	-- Files management
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
	})
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Others
	use("christoomey/vim-tmux-navigator")
	use("nvim-lualine/lualine.nvim")
	use({
		"folke/todo-comments.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
		},
	})
end)
