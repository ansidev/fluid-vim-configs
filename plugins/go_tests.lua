local fn_mappings = {
  ["<leader>a"] = {
    name = "Code actions",
    f = {
      "<Cmd>GoTests<CR>",
      "Generate test for functions",
    },
    a = {
      "<Cmd>GoTestsAll<CR>",
      "Generate test for functions and methods",
    },
  },
}

return {
  mode = "extend",
  options = {
    custom_configs = {
      mappings = {
        n = fn_mappings,
        v = fn_mappings,
      },
    },
  },
}
