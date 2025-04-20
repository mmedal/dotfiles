return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = require("utils.header").get_dashboard_header(),
      },
    },
  },
}
