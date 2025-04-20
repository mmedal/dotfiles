local filetypes = {
  { text = "cs" },
  { text = "javascript" },
  { text = "json" },
  { text = "lua" },
  { text = "markdown" },
  { text = "python" },
  { text = "ruby" },
  { text = "rust" },
  { text = "typescript" },
  { text = "zig" },
}

return {
  "snacks.nvim",
  keys = {
    -- Dashboard
    { "<leader>e", false },
    { "<leader>E", false },
    { "<leader>fe", false },
    { "<leader>fE", false },
    -- Scratch
    { "<leader>.", false },
    { "<leader>S", false },
    {
      "<leader>__",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>_n",
      function()
        require("utils.scratch").new_scratch(filetypes)
      end,
      desc = "New Scratch Buffer",
    },
    {
      "<leader>_s",
      function()
        require("utils.scratch").select_scratch()
      end,
      desc = "Select Scratch Buffer",
    },
  },
  opts = {
    dashboard = {
      preset = {
        header = require("utils.header").get_dashboard_header(),
      },
    },
  },
}
