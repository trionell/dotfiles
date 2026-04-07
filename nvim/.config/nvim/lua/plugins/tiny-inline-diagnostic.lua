vim.pack.add({'https://github.com/rachartier/tiny-inline-diagnostic.nvim'})

require("tiny-inline-diagnostic").setup({
  options = {
    multilines = {
      enables = true
    }
  }
})
vim.diagnostic.config({ virtual_text = false })
