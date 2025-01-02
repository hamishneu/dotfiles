local random_quotes = function()
  local handle = io.popen("sh quote.sh")
  local result = handle and handle:read("*a") or ""
  if handle then
    handle:close()
  end
  return result
end

local quote = random_quotes()

-- wrap text
local function wrap_text(quote, width)
  local input_text = quote or ""

  local wrapped_lines = {}

  for line in input_text:gmatch("[^\n]*") do
    if line == "" then
      -- table.insert(wrapped_lines, "")
    else
      local line_start = 1
      while line_start <= #line do
        local line_end = math.min(line_start + width - 1, #line)

        if line_end < #line then
          local space_pos = line:sub(line_start, line_end):find(" [^ ]*$")
          if space_pos then
            line_end = line_start + space_pos - 1
          end
        end

        local segment = line:sub(line_start, line_end):gsub("^%s*", "")
        if segment ~= "" then
          table.insert(wrapped_lines, segment)
        end

        line_start = line_end + 1
      end
    end
  end

  -- Concatenate wrapped lines and append the source
  local wrapped_text = table.concat(wrapped_lines, "\n")
  return wrapped_text
end

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = wrap_text(quote, 60),
      },
      formats = {
        header = { "%s", align = "left" },
        footer = { "%s", align = "left" },
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
      },
    },
  },
}
