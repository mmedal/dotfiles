local M = {}

M.headers = {
  neovim = "neovim.cat",
}

local selected_header = M.headers.neovim

local function get_header(header)
  return vim.fn.readfile(vim.fn.stdpath("config") .. "/assets/" .. header)
end

function M.get_dashboard_header()
  return table.concat(get_header(selected_header), "\n")
end

return M
