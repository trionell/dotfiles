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
})

-- Enable plugins
require("plugins.tiny-inline-diagnostic")
require("mini.completion").setup()
vim.o.completeopt = "menu,menuone,noinsert"

-- Confirm completion with <Tab> or <CR>; behave normally when menu is closed
vim.keymap.set('i', '<Tab>', function()
  return vim.fn.pumvisible() == 1 and '<C-y>' or '<Tab>'
end, { expr = true })
vim.keymap.set('i', '<CR>', function()
  return vim.fn.pumvisible() == 1 and '<C-y>' or '<CR>'
end, { expr = true })

-- Mason / LSPs
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
  close_if_last_window = true,
})

-- vscode color scheme
local c = require("vscode.colors").get_colors()
require("vscode").setup({
  transparent = true,
  underline_links = true,
  disable_nvimtree_bg = true,
  terminal_colors = true,
  -- Override highlight groups (see ./lua/vscode/theme.lua)
  group_overrides = {
    -- this supports the same val table as vim.api.nvim_set_hl
    -- use colors from this colorscheme by requiring vscode.colors!
    Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
  }
})

vim.cmd.colorscheme "vscode"
