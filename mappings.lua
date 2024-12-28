local M = {}

function M.load_smart_splits_mappings()
  return {
    n = {
      {
        "<A-Up>",
        function()
          require("smart-splits").move_cursor_up()
        end,
        desc = "Go to the up window",
      },
      {
        "<A-Down>",
        function()
          require("smart-splits").move_cursor_down()
        end,
        desc = "Go to the down window",
      },
      {
        "<A-Left>",
        function()
          require("smart-splits").move_cursor_left()
        end,
        desc = "Go to the left window",
      },
      {
        "<A-Right>",
        function()
          require("smart-splits").move_cursor_right()
        end,
        desc = "Go to the right window",
      },
      {
        "<A-h>",
        function(amount)
          require("smart-splits").resize_up(amount)
        end,
        desc = "Resize up",
      },
      {
        "<A-j>",
        function(amount)
          require("smart-splits").resize_down(amount)
        end,
        desc = "Resize down",
      },
      {
        "<A-k>",
        function(amount)
          require("smart-splits").resize_left(amount)
        end,
        desc = "Resize left",
      },
      {
        "<A-l>",
        function(amount)
          require("smart-splits").resize_right(amount)
        end,
        desc = "Resize right",
      },
      {
        "<leader><leader>h",
        function()
          require("smart-splits").swap_buf_up()
        end,
        desc = "Swap buffer up",
      },
      {
        "<leader><leader>j",
        function()
          require("smart-splits").swap_buf_down()
        end,
        desc = "Swap buffer down",
      },
      {
        "<leader><leader>k",
        function()
          require("smart-splits").swap_buf_left()
        end,
        desc = "Swap buffer left",
      },
      {
        "<leader><leader>l",
        function()
          require("smart-splits").swap_buf_right()
        end,
        desc = "Swap buffer right",
      },
    },
  }
end

return M
