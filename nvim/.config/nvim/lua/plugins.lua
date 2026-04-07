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
})

require("mason").setup()

vim.lsp.enable("lua_ls")
vim.lsp.enable("jdtls")

-- Telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Snacks
require("snacks").setup()

-- Neo-tree
require("neo-tree").setup({
  window = {
    mappings = {
      ["P"] = {
        "toggle_preview",
        config = {
          use_float = true,
          use_image_nvim = true,
          use_snacks_image = true,
          title = 'Neo-tree Preview',
        },
      },
    }
  },
  close_if_last_windows = true,
})
