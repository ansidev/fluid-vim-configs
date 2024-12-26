local util = require "lspconfig/util"

return {
  mode = "extend",
  options = {
    builtin_configs = {
      servers = {
        gopls = {
          cmd = { "gopls", "serve" },
          filetypes = { "go", "gomod" },
          root_dir = util.root_pattern("go.work", "go.mod", ".git"),
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
            },
          },
        },
        ts_ls = {},
        buf_ls = {},
        -- yamlls = {
        --   settings = {
        --     yaml = {
        --       schemas = require('schemastore').yaml.schemas(),
        --     },
        --   },
        -- },
      },
    },
  },
}
