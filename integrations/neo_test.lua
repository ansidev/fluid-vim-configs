local fn = {}

fn.after_setup = function(custom_configs)
  local adapters = custom_configs.adapters or {}
  local neotest_adapters = {}
  for adapter, adapter_options in pairs(adapters) do
    if type(adapter_options) ~= "table" then
      adapter_options = {}
    end

    local status_ok, adapter_module = pcall(require, adapter)
    if not status_ok then
      vim.api.nvim_err_writeln("Invalid neotest adapter name: " .. adapter)
      return
    end

    local config_status_ok, adapter_configs = pcall(adapter_module, adapter_options)
    if not config_status_ok then
      vim.api.nvim_err_writeln("Invoking setup function failed for adapter: " .. adapter)
      return
    end

    table.insert(neotest_adapters, adapter_configs)
  end

  require("neotest").setup({
    adapters = neotest_adapters,
  })
end

return fn
