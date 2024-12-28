local M = {}

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
