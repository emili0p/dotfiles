return {
  --[[ {
    "rebelot/kanagawa.nvim",
    priority = 1000, -- para que se cargue primero
    config = function()
      require("kanagawa").setup({
        theme = "wave", -- opciones: "wave", "dragon", "lotus"
        transparent = false, -- true si quieres fondo transparente
      })
      vim.cmd("colorscheme kanagawa")
    end,
  }, ]]
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    -- opts = {}
  },

  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
  },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "akinsho/toggleterm.nvim",
    },
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile" },
    -- Optional: Configure keybinding to open LazyGit
    keys = {
      {
        "<leader>lg",
        function()
          require("toggleterm.terminal").ToggleTerm("lazygit")
        end,
        desc = "Open Lazygit",
      },
    },
    config = function()
      -- Optional: Configure LazyGit to open files in the same Neovim instance
      vim.g.lazygit_edit_command = "nvr --remote-wait +%l %f" -- Example with nvr
    end,
  },
}
