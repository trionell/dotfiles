local c = require("vscode.colors").get_colors()
require("vscode").setup({
  transparent = true,
  underline_links = true,
  disable_nvimtree_bg = true,
  terminal_colors = true,
  group_overrides = {
    Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
  },
})

vim.cmd.colorscheme "vscode"

-- Override diff sign colors to remain visible with transparent background
vim.api.nvim_set_hl(0, "MiniDiffSignAdd",    { fg = "#4ec994" })
vim.api.nvim_set_hl(0, "MiniDiffSignChange", { fg = "#dcdcaa" })
vim.api.nvim_set_hl(0, "MiniDiffSignDelete", { fg = "#f44747" })
