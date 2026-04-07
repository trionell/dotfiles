vim.pack.add({
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/mason-org/mason.nvim'
})

require("mason").setup()

vim.lsp.enable("lua_ls")
vim.lsp.enable("jdtls")
