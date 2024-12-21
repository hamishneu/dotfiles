return {
  -- add theme
  {
    "navarasu/onedark.nvim",
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
