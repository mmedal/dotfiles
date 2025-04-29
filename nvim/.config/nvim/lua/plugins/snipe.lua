return {
  "leath-dub/snipe.nvim",
  keys = {
    {
      "<leader>,",
      function()
        require("snipe").open_buffer_menu()
      end,
      desc = "Snipe Buffer",
    },
  },
  opts = {},
}
