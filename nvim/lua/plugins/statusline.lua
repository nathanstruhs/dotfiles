return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "tokyonight",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "diagnostics" },
        lualine_c = {},
        lualine_x = { "searchcount", "selectioncount" },
        lualine_y = { "diff" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
}
