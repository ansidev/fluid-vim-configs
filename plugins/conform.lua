return {
  mode = "extend",
  options = {
    builtin_configs = {
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = { "eslint_d", "deno_fmt" },
        typescript = { "eslint_d", "deno_fmt" },
        json = { "deno_fmt" },
        markdown = { "deno_fmt" },
        ["*"] = { "codespell" },
      },
    },
  },
}
