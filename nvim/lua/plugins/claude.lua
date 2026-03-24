return {
  {
    "coder/claudecode.nvim",
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
    },
    opts = {
      terminal = {
        provider = "snacks",
      },
    },
  },
}
