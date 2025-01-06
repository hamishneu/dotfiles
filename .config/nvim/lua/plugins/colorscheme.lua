return {
  -- add theme
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "darker",
      transparent = true,
    },
    priority = 1000,
  },

  -- Configure LazyVim to load
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
