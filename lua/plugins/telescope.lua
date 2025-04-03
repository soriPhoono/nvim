return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope files", silent = true })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep", silent = true })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers", silent = true })
    end,
  },
}
