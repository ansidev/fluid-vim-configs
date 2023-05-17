local function load_file_mappings(options)
  local opts = options or {}
  local title = opts.title or "Actions"
  local menu_items = opts.menu_items or {}
  local menu = {}
  local handlers = {}

  for _, item in ipairs(menu_items) do
    if type(item[1]) ~= "string" or item[1] == "" then
      vim.api.nvim_err_writeln "Invalid type for label, label type must be string"
      return
    end
    if type(item[2]) ~= "function" then
      vim.api.nvim_err_writeln "Invalid type for handler, handler type must be a function"
      return
    end

    table.insert(menu, item[1])
    handlers[item[1]] = item[2]
  end

  return function(state)
    vim.ui.select(
      menu,
      {
        prompt = title,
      },
      function(action)
        local handler = handlers[action]
        if type(handler) ~="function" then
          vim.api.nvim_err_writeln "No handler for the selected action, please re-check your config"
          return
        end
        handler(state)
      end
    )
  end
end

local function load_filesystem_mappings()
  return {
    u = load_file_mappings({
      title = "File actions",
      menu_items = {
        {
          "Run test",
          function(state)
            local node = state.tree:get_node()
            require('neotest').run.run(node.path)
          end
       }
      }
    })
  }
end

return {
  mode = "extend",
  options = {
    builtin_configs = {
      filesystem = {
        window = {
          mappings = load_filesystem_mappings(),
        }
      },
    },
  },
}
