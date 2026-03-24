return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        graphql = {},
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
