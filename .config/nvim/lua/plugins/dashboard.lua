local random_quotes = function()
  math.randomseed(os.time())
  local quotes = require("quotes")
  return quotes[math.random(#quotes)]
end

local quote = random_quotes()
local source = quote.source and ("\n\n— " .. quote.source) or ""

-- wrap text
local function wrap_text(quote_table, width)
  local input_text = quote_table.quote or ""
  local source = quote_table.source and ("\n\n— " .. quote_table.source) or ""

  local wrapped_lines = {}

  -- Process the quote text
  for line in input_text:gmatch("[^\n]*") do
    if line == "" then
      table.insert(wrapped_lines, "")
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
  return wrapped_text .. source
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
