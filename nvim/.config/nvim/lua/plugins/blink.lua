return {
  "saghen/blink.cmp",
  opts = {
    signature = { enabled = true },
    keymap = {
      preset = "enter",
      ["<C-h>"] = { "hide", "fallback" },
      ["<C-l>"] = { "show_signature", "hide_signature", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<Up>"] = { "scroll_documentation_up", "fallback" },
      ["<Down>"] = { "scroll_documentation_down", "fallback" },
    },
    completion = {
      list = {
        selection = {
          preselect = false,
        },
      },
    },
  },
}
