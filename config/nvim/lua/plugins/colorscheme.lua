--[[ return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}  ]]
return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- se carga primero
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
      })

      vim.o.background = "dark"
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
