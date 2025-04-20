return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = "早朝から夕方まで",
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
