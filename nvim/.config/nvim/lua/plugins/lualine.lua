return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options.theme = "catppuccin"
    opts.sections.lualine_z = {}
    return opts
  end,
}
