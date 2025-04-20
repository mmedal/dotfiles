return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    table.insert(opts.spec, {
      mode = { "n", "v" },
      { "<leader>_", group = "+scratch", icon = { icon = "󱥰 ", color = "purple" } },
    })
    return opts
  end,
}
