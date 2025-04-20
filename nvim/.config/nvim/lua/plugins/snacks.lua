return {
  "snacks.nvim",
  keys = {
    { "<leader>e", false },
    { "<leader>E", false },
    { "<leader>fe", false },
    { "<leader>fE", false },
  },
  opts = {
    dashboard = {
      preset = {
        header = require("utils.header").get_dashboard_header(),
      },
    },
  },
}
