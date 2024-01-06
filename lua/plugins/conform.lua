return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft = {
      lua = { "stylua" },
      sh = { "shfmt" },
      html = { "htmlbeautifier" },
    }
    return opts
  end,
}
