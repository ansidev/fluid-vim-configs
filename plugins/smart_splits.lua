return {
  mode = "extend",
  options = {
    builtin_configs = {
      ignored_filetypes = {
        "nofile",
        "quickfix",
        "prompt",
      },
      ignored_buftypes = {
        "NvimTree",
        "neo-tree",
      },
      resize_mode = {
        quit_key = '<ESC>',
        -- keys to use for moving in resize mode
        -- in order of left, down, up' right
        resize_keys = { "Left", "Down", "Up", "Right" },
        hooks = {
          on_enter = function()
            vim.notify('Entering resize mode')
          end,
          on_leave = function()
            vim.notify('Exiting resize mode, bye')
          end,
        },
      },
      at_edge = "wrap",
    },
  },
}
