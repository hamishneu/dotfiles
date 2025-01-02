return {
  -- add theme
  {
    "datsfilipe/vesper.nvim",
    priority = 1000,
  },

  -- Configure LazyVim to load
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vesper",
    },
  },
}
