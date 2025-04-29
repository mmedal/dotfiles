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
  priority = 100,
  keys = {
    -- Main buffers
    { "<leader>,", false },
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
        require("utils.scratch").toggle_scratch()
      end,
      desc = "Toggle scratch buffer",
    },
    {
      "<leader>_n",
      function()
        require("utils.scratch").new_scratch(filetypes)
      end,
      desc = "New scratch buffer",
    },
    {
      "<leader>_s",
      function()
        require("utils.scratch").select_scratch()
      end,
      desc = "Select scratch buffer",
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
