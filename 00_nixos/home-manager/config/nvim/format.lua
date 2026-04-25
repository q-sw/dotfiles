require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    go = { "gofmt" },
    nix = { "nixpkgs_fmt" },
    sh = { "shfmt" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
