-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- jk/kj to escape (from vscodevim config)
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")

-- Swap a/A (from vscodevim config)
vim.keymap.set("n", "a", "A")
vim.keymap.set("n", "A", "a")

-- Format with Ctrl-p (from VS Code keybinding)
vim.keymap.set("n", "<C-p>", function()
  require("conform").format()
end, { desc = "Format document" })

-- Exit terminal mode (matches jk escape pattern)
vim.keymap.set("t", "jk", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Splits (from VS Code keybindings)
vim.keymap.set("n", "<C-\\>", "<cmd>vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<C-->", "<cmd>split<CR>", { desc = "Horizontal split" })
