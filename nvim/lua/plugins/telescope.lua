
return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim", build = "make"
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<C-Esc>"] = function()
                vim.cmd("stopinsert") -- Exits insert mode but keeps the picker open
              end,
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
          file_ignore_patterns = {
            ".git/"
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<C-/>", builtin.live_grep, {})
      vim.keymap.set("n", "<C-b>", builtin.buffers, {})
      vim.keymap.set("n", "<C-s>", builtin.grep_string, {})
      vim.keymap.set("n", "<C-o>", builtin.oldfiles, {})

      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("fzf")
    end,
  },
}
