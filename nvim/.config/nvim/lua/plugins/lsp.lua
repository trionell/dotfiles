require("mason").setup()

vim.lsp.enable("lua_ls")
vim.lsp.enable("jdtls")

vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover text" })
vim.keymap.set("n", "C-k", vim.lsp.buf.signature_help, { desc = "Show signature" })
