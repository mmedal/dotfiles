return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      {
        "<leader>fd",
        function()
          require("fzf-lua").files({
            cwd = "~/dotfiles",
            prompt = "Dotfiles> ",
          })
        end,
        desc = "Find Dotfiles",
      },
    },
  },
}
