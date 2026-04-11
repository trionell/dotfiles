require("mini.completion").setup()
vim.o.completeopt = "menu,menuone,noinsert"

-- Confirm completion with <Tab> or <CR>; behave normally when menu is closed
vim.keymap.set('i', '<Tab>', function()
  return vim.fn.pumvisible() == 1 and '<C-y>' or '<Tab>'
end, { expr = true })
vim.keymap.set('i', '<CR>', function()
  return vim.fn.pumvisible() == 1 and '<C-y>' or '<CR>'
end, { expr = true })
