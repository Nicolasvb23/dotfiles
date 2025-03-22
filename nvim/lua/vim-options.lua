vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " " -- Set leader key to space
vim.opt.swapfile = false -- Disable swap file
vim.wo.number = true -- Enable line numbers
vim.opt.undofile = true -- Enable persistent undo
vim.opt.clipboard = "unnamedplus" -- use clipboard

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<C-t>', ':NvimTreeFindFile<CR>')

-- Better window navigation
vim.keymap.set('n', '<C-,>', ':-tabnext<CR>')
vim.keymap.set('n', '<C-.>', ':+tabnext<CR>')

-- Function to copy the relative path to the clipboard
vim.api.nvim_set_keymap('n', '<leader>cp', [[:let @+=expand('%')<CR>]], { noremap = true, silent = true })

-- LSP keymaps
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", {})
vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>') -- Clear search highlights
