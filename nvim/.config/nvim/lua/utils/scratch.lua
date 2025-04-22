local M = {}

local function generate_datetime_filename()
  local timestamp = os.date("%Y-%m-%d_%H-%M-%S")
  return timestamp
end

local column_widths = { 0, 0, 0, 0 }

local function update_column_widths(item)
  column_widths[1] = math.max(column_widths[1], vim.api.nvim_strwidth(item.cwd))
  column_widths[2] = math.max(column_widths[2], vim.api.nvim_strwidth(item.icon))
  column_widths[3] = math.max(column_widths[3], vim.api.nvim_strwidth(item.name))
  column_widths[4] = math.max(column_widths[4], vim.api.nvim_strwidth(item.branch))
end

local function process_item(item)
  item._path = item.file
  item.branch = item.branch and ("branch:%s"):format(item.branch) or ""
  item.cwd = item.cwd and vim.fn.fnamemodify(item.cwd, ":p:~") or ""
  item.icon = item.icon or Snacks.util.icon(item.ft, "filetype")
  item.preview = { text = item.file }
  item.name = "Scratch"
  update_column_widths(item)
end

local function process_items(items)
  for _, item in ipairs(items) do
    process_item(item)
  end
end

local function format_item_text(item)
  local parts = { item.cwd, item.icon, item.name, item.branch }
  for i, part in ipairs(parts) do
    parts[i] = part .. string.rep(" ", column_widths[i] - vim.api.nvim_strwidth(part))
  end
  return table.concat(parts, " ")
end

function M.select_scratch()
  local items = Snacks.scratch.list()
  process_items(items)
  Snacks.picker.pick({
    source = "scratch",
    items = items,
    format = "text",
    layout = {
      layout = { title = " Select Scratch Buffer: " },
      preview = true,
      preset = function()
        return vim.o.columns >= 120 and "default" or "vertical"
      end,
    },
    on_change = function()
      vim.cmd.startinsert()
    end,
    transform = function(item)
      item.text = format_item_text(item)
    end,
    win = {
      input = {
        keys = {
          ["<c-x>"] = { "delete", mode = { "i", "n" } },
        },
      },
    },
    actions = {
      delete = function(picker, item)
        for _, entry in ipairs(items) do
          if entry.cwd == item.cwd then
            os.remove(item.file)
          end
        end
        picker:close()
        vim.schedule(function()
          M.select_scratch()
        end)
      end,
    },
    confirm = function(picker, item)
      if item then
        picker:close()
        vim.schedule(function()
          Snacks.scratch.open({ icon = item.icon, file = item.file, name = item.name, ft = item.ft })
        end)
      end
    end,
  })
end

function M.new_scratch(filetypes)
  Snacks.picker.pick({
    source = "scratch",
    items = filetypes,
    format = "text",
    layout = {
      preset = "vscode",
      preview = false,
      layout = { title = " Select a filetype: " },
    },
    actions = {
      confirm = function(picker, item)
        picker:close()
        -- Close the picker window immediately
        vim.schedule(function()
          local items = picker:items()
          if #items == 0 then
            Snacks.scratch({ ft = picker:filter().pattern, name = generate_datetime_filename() })
          else
            Snacks.scratch({ ft = item.text, name = generate_datetime_filename() })
          end
        end)
      end,
    },
  })
end

-- Add a new toggle function that truly toggles
function M.toggle_scratch()
  local scratch_buffers = Snacks.scratch.list()

  -- Check if we're currently in a scratch buffer
  local current_buf = vim.api.nvim_get_current_buf()
  local current_buf_name = vim.api.nvim_buf_get_name(current_buf)

  for _, item in ipairs(scratch_buffers) do
    if item.file == current_buf_name then
      -- We're in a scratch buffer, close it
      vim.cmd("close")
      return
    end
  end

  -- Not in a scratch buffer
  if #scratch_buffers > 0 then
    -- If there are existing scratch buffers, open the most recent one
    local latest = scratch_buffers[1]
    Snacks.scratch.open({
      icon = latest.icon,
      file = latest.file,
      name = latest.name,
      ft = latest.ft,
    })
  else
    -- No scratch buffers exist, show filetype selector
    M.new_scratch(filetypes)
  end
end

return M
