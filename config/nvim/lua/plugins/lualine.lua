local function os_icon()
  return ""
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  opts = {
    options = {
      theme = "auto",
      globalstatus = true,

      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
    },

    sections = {
      lualine_a = {
        {
          os_icon,
          separator = { left = "", right = "" },
          padding = { left = 1, right = 1 }, -- 🔹 pequeño
        },
        {
          "mode",
          fmt = function(str)
            return str:upper()
          end,
          padding = { left = 1, right = 2 }, -- 🔹 separado
        },
      },

      lualine_b = {
        "branch",
      },

      lualine_c = {
        { "filetype", icon_only = true }, -- 🔹 vuelve el logo del lenguaje
        {
          "filename",
          path = 1,
        },
      },

      lualine_x = {
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = {
            error = " ",
            warn = " ",
            info = " ",
            hint = "󰌵 ",
          },
        },
      },

      lualine_y = {
        { "location" },
      },

      lualine_z = {
        {
          function()
            return os.date(" %H:%M")
          end,
          separator = { right = "" },
          padding = { left = 1, right = 1 },
        },
      },
    },
  },
}
