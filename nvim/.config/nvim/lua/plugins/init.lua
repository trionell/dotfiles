vim.pack.add({
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/mason-org/mason.nvim',
  -- Telescope
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-telescope/telescope.nvim',
  -- Neo-tree
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3')
  },
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/folke/snacks.nvim',
  -- Vscode color scheme
  'https://github.com/Mofiqul/vscode.nvim',
  -- Diagnostics
  'https://github.com/rachartier/tiny-inline-diagnostic.nvim',
})

require("plugins.tiny-inline-diagnostic")
require("plugins.completion")
require("plugins.lsp")
require("plugins.telescope")
require("plugins.snacks")
require("plugins.neo-tree")
require("plugins.colorscheme")
require("plugins.mini-diff")
