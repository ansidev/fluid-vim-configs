local fn = {}

fn.setup = function(_)
  vim.env.ESLINT_D_PPID = vim.fn.getpid()
  require("lint").linters_by_ft = {
    markdown = { "vale" },
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    scss = { "stylelint" },
    less = { "stylelint" },
    css = { "stylelint" },
    sass = { "stylelint" },
    yaml = { "actionlint", "yamllint" },
    ["yaml.ansible"] = { "ansible_lint" },
  }

  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
      -- try_lint without arguments runs the linters defined in `linters_by_ft`
      -- for the current filetype
      require("lint").try_lint()
    end,
  })
end

return fn
