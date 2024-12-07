return {
  "hrsh7th/nvim-cmp",
  opts = {
    enabled = function()
      return (vim.bo.ft ~= "markdown")
    end,
  },
}
