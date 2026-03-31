return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        graphql = {},
        ts_ls = {
          init_options = {
            maxTsServerMemory = 8192,
          },
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "graphql-language-service-cli",
        "prettier",
        "eslint_d",
      },
    },
  },
}
