-- Navigate vim panes better
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')

-- Better window navigation
vim.keymap.set("n", "<C-t>", ":tabnew<CR>")  -- Mapea Ctrl+t para abrir una nueva pestaña
vim.keymap.set('n', '<C-,>', ':-tabnext<CR>')
vim.keymap.set('n', '<C-.>', ':+tabnext<CR>')

-- Function to copy the relative path to the clipboard
vim.api.nvim_set_keymap('n', '<leader>cp', [[:let @+=expand('%')<CR>]], { noremap = true, silent = true })

-- LSP keymaps
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", {})
vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, {})

-- Snacks keymaps
local opts = { hidden = true }

vim.keymap.set("n", "<C-b>", function() Snacks.picker.buffers(opts) end)
vim.keymap.set("n", "<C-/>", function() Snacks.picker.grep(opts) end)
vim.keymap.set("n", "<C-n>", function() Snacks.explorer(opts) end)
vim.keymap.set("n", "<C-p>", function() Snacks.picker.files(opts) end)
vim.keymap.set("n", "<C-;>", function()
  local selected_text = vim.fn.getreg('"')

  if selected_text:find("\n") then
    selected_text = ""
  end

  Snacks.picker.grep({
    exclude = { "**/docs/**", "**/test/**" },
    need_search = true,
    regex = true,
    search = selected_text,
  })
end)

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>') -- Clear search highlights
