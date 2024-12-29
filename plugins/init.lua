local plugin_fn = require "functions.plugin"
local user_mappings = require "user.mappings"

local P = {
  {
    "jcdickinson/codeium.nvim",
    event = "InsertEnter",
    dependencies = {
      {
        "jcdickinson/http.nvim",
        build = "cargo build --workspace --release"
      },
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local plugin_configs = plugin_fn.load_custom_plugin_configs("user.plugins.codeium")
      require("codeium").setup(plugin_configs)
      local cmp = require("cmp")
      local config = cmp.get_config()
      table.insert(config.sources, { name = "codeium" })
      cmp.setup(config)
    end
  },
  { "nvim-neotest/neotest-go" },
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    wk_mappings = user_mappings.smart_splits,
    config = function()
      plugin_fn.config_v2 {
        fv_plugin_id = "smart_splits",
        plugin_module = "smart-splits",
      }
    end,
  },
  {
    "danilamihailov/beacon.nvim",
    event = "VeryLazy",
  },
}

return P
