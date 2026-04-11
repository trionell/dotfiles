require("mini.diff").setup({
  view = {
    style = 'sign',
    signs = { add = '+', change = '~', delete = '-' },
  },
})

-- jdtls sets buftype=nofile for Java buffers, which mini.diff skips by default
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function(ev) MiniDiff.enable(ev.buf) end,
})
