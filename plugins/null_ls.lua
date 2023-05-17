local null_ls = require "null-ls"

local sleek   = {
  name = 'sleek',
  meta = {
    url = "https://github.com/nrempel/sleek",
    description = "Rust-based SQL formatter",
  },
  method = null_ls.methods.FORMATTING,
  filetypes = { "sql" },
  generator = null_ls.formatter({
    command = "sleek",
    args = { "--indent-spaces", "2", "--uppercase", "--lines-between-queries", "1" },
    from_stdin = true,
    to_stdin = true,
  }),
}

return {
  mode = "extend",
  options = {
    builtin_configs = {
      debug = true,
      sources = {
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.code_actions.impl,
        null_ls.builtins.code_actions.gitsigns,

        null_ls.builtins.diagnostics.actionlint,
        null_ls.builtins.diagnostics.ansiblelint,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.stylelint,
        null_ls.builtins.diagnostics.editorconfig_checker,
        -- null_ls.builtins.diagnostics.markdownlint_cli2,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.diagnostics.staticcheck,
        null_ls.builtins.diagnostics.terraform_validate,
        null_ls.builtins.diagnostics.tfsec,
        null_ls.builtins.diagnostics.tidy,
        null_ls.builtins.diagnostics.tsc,
        -- null_ls.builtins.diagnostics.yamllint,

        null_ls.builtins.formatting.yamlfmt.with({
          extra_args = { "-formatter", "type=basic,retain_line_breaks=true" },
        }),
        null_ls.builtins.formatting.deno_fmt.with({
          extra_args = { "--line-width", "120" },
        }),
        -- null_ls.builtins.formatting.dprint,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.hclfmt,
        null_ls.builtins.formatting.htmlbeautifier,
        null_ls.builtins.formatting.nginx_beautifier,
        null_ls.builtins.formatting.packer,
        -- null_ls.builtins.formatting.pg_format,
        -- null_ls.builtins.formatting.prettierd,
        -- null_ls.builtins.formatting.pg_format,
        null_ls.builtins.formatting.stylelint,
        -- null_ls.builtins.formatting.sqlfluff.with({
        --   extra_args = { "--dialect", "postgres" },
        -- }),
        null_ls.builtins.formatting.terraform_fmt,
        null_ls.builtins.formatting.tidy,
        null_ls.builtins.completion.luasnip,
        sleek,
      },
    },
  },
}
