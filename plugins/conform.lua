return {
  mode = "extend",
  options = {
    builtin_configs = {
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        ["*"] = { "codespell" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },
}
