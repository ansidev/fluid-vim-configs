return {
  mode = "extend",
  options = {
    custom_configs = {
      adapters = {
        ["neotest-go"] = {
          experimental = {
            test_table = true,
          },
          args = { "-count=1", "-timeout=60s" }
        },
      },
    },
  },
}
