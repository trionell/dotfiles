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

vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
