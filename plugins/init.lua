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
  {
    "ansidev/project.nvim",
    event = "VeryLazy",
    wk_mappings = user_mappings.project_nvim,
    config = function()
      plugin_fn.config_v2 {
        fv_plugin_id = "project_nvim",
      }
    end,
  },
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup({
        app = {
          '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',
          '--window-size=980,1440',
          '--window-position=1580,0',
          '--user-data-dir=/tmp/chrome-profile-$(date +%s)',
          '--no-first-run',
          '--disable-extensions',
        },
      })
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
}

return P
