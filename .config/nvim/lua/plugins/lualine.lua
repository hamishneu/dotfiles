-- very minimal lualine
return {
  "nvim-lualine/lualine.nvim",
  opts = {
    section_separators = "",
    component_separators = "",
    sections = {
      lualine_a = { "mode" },
      lualine_b = { { "filename", path = 0 } },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    },
  },
}
