util = require "lspconfig/util"

return {
  mode = "extend",
  options = {
    builtin_configs = {
      ensure_installed = {
        "gopls",
        "yamlls",
        "tsserver",
      },
    },
  },
}
