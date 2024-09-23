require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"ansiblels",
		"bashls",
		"cmake",
		"dockerls",
		"gopls",
		"helm_ls",
		"jinja_lsp",
		"jsonls",
		"jedi_language_server",
		"pyright",
		"terraformls",
		"yamlls",
	},
})

require("lspconfig").terraformls.setup({})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.tf", "*.tfvars" },
	callback = function()
		vim.lsp.buf.format()
	end,
})

-- DAP
require("mason-nvim-dap").setup({
	ensure_installed = { "python", "delve" },
})

-- Linter and Formater installation

require("mason-tool-installer").setup({
	ensure_installed = {
		-- linter
		"ansible-lint",
		"flake8",
		"gitleaks",
		"golangci-lint",
		"markdownlint",
		"pylint",
		"tflint",
		"tfsec",
		"trivy",
		"yamllint",
		-- formater
		"black",
		"goimports",
		"prettier",
		"stylua",
	},
})

-- Linter configuration
local lint = require("lint")
lint.linters_by_ft = {
	markdown = { "markdownlint" },
	go = { "trivy", "golangci-lint" },
	python = { "trivy", "flake8", "pylint" },
	terraform = { "trivy", "tflint", "tfsec" },
	yaml = { "yamllint" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

vim.keymap.set("n", "<leader>l", function()
	lint.try_lint()
end, { desc = "Trigger linting for current file" })

-- Formater configuration
local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		lua = { "stylua" },
		python = { "black" },
		go = { "goimports" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	},
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file or range (in visual mode)" })
