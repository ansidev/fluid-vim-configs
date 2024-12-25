local configs = require "core.configs"
local user_mappings = require "user.mappings"
local settings = require "core.settings"
local plugin_fn = require "functions.plugin"

local P = {
  {
    "folke/tokyonight.nvim",
    event = "VeryLazy",
    config = function()
      local theme_configs = configs.tokyonight or {}
      if settings.theme == "tokyonight" and settings.theme_variant ~= nil then
        theme_configs.style = settings.theme_variant
      end

      plugin_fn.config_v2 {
        fv_plugin_id = "tokyonight",
        default_plugin_configs = theme_configs,
      }
    end,
  },
  {
    "Shatur/neovim-ayu",
    event = "VeryLazy",
    config = function()
      local theme_configs = configs.ayu or {}
      if settings.theme == "ayu" and settings.theme_variant ~= nil then
        theme_configs.style = settings.theme_variant
      end

      plugin_fn.config_v2 {
        fv_plugin_id = "ayu",
        default_plugin_configs = theme_configs,
      }
    end,
  },
  {
    'Everblush/nvim',
    name = 'everblush',
    event = "VeryLazy",
    config = function()
      plugin_fn.config_v2 {
        fv_plugin_id = "everblush",
      }
    end,
  },
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
  {
    "aaditeynair/conduct.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    cmd = {
      "ConductNewProject",
      "ConductLoadProject",
      "ConductLoadLastProject",
      "ConductLoadProjectConfig",
      "ConductReloadProjectConfig",
      "ConductDeleteProject",
      "ConductRenameProject",
      "ConductProjectNewSession",
      "ConductProjectLoadSession",
      "ConductProjectDeleteSession",
      "ConductProjectRenameSession",
    },
    mappings = user_mappings.load_conduct_mappings(),
    config = function()
      plugin_fn.config_v2 {
        fv_plugin_id = "conduct",
      }
      require("telescope").load_extension("conduct")
    end
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    },
    event = "VimEnter",
    config = function()
      plugin_fn.config_v2 {
        fv_plugin_id = "neo_test",
        plugin_module = "neotest",
        hooks = {
          user_after_setup = true,
        }
      }
    end,
  },
  {
    "yanskun/gotests.nvim",
    ft = "go",
    config = function()
      plugin_fn.config_v2 {
        fv_plugin_id = "go_tests",
        plugin_module = "gotests",
        hooks = {
          user_after_setup = true,
        }
      }
    end,
  },
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    mappings = user_mappings.load_smart_splits_mappings(),
    config = function()
      plugin_fn.config_v2 {
        fv_plugin_id = "smart_splits",
        plugin_module = "smart-splits",
      }
    end
  },
}

return P
