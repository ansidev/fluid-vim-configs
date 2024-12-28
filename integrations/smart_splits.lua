local mapping_fn = require "functions.mapping"
local fn = {}

fn.setup = function(custom_configs)
  local mappings = custom_configs.mappings or {}
  mapping_fn.register_mappings(mappings)
end

return fn
