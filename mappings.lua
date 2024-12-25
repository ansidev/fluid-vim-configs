local M = {}

function M.load_conduct_mappings()
  return {
    n = {
      -- Project
      { "<leader>p", group = "Project" },
      {
        "<leader>pa",
        function()
          local FvInput = require("ui.input")
          local input = FvInput({
            title = "Project name",
            default_value = "",
            on_submit = function(value)
              vim.cmd("ConductNewProject " .. value)
            end,
          })

          input:mount()
        end,
        desc = "Add project",
      },
      { "<leader>pd", "<Cmd>ConductDeleteProject<CR>", desc = "Delete the current project" },
      { "<leader>pl", "<Cmd>Telescope conduct projects<CR>", desc = "List projects" },
    }
  }
end

local window_mappings = {
  { "<A-h>", "<Cmd>lua require('smart-splits').move_cursor_up()<CR>", desc = "Go to the up window" },
  { "<A-j>", "<Cmd>lua require('smart-splits').move_cursor_down()<CR>", desc = "Go to the down window" },
  { "<A-k>", "<Cmd>lua require('smart-splits').move_cursor_left()<CR>", desc = "Go to the left window" },
  { "<A-l>", "<Cmd>lua require('smart-splits').move_cursor_right()<CR>", desc = "Go to the right window" },
  { "<A-Up>", "<Cmd>lua require('smart-splits').move_cursor_up()<CR>", desc = "Go to the up window" },
  { "<A-Down>", "<Cmd>lua require('smart-splits').move_cursor_down()<CR>", desc = "Go to the down window" },
  { "<A-Left>", "<Cmd>lua require('smart-splits').move_cursor_left()<CR>", desc = "Go to the left window" },
  { "<A-Right>", "<Cmd>lua require('smart-splits').move_cursor_right()<CR>", desc = "Go to the right window" },
}

function M.load_smart_splits_mappings()
  return {
    n = window_mappings,
    i = window_mappings,
    v = window_mappings,
    t = window_mappings,
  }
end

return M
