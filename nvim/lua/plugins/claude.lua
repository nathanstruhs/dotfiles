return {
  {
    "coder/claudecode.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
    },
    opts = {
      terminal = {
        provider = "none",
      },
    },
  },
}
