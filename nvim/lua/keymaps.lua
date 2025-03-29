-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Better window navigation
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

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>') -- Clear search highlights
