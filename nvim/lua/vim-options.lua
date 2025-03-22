vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " " -- Set leader key to space
vim.opt.swapfile = false -- Disable swap file

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

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>') -- Clear search highlights
vim.wo.number = true -- Enable line numbers
vim.opt.undofile = true -- Enable persistent undo
vim.opt.clipboard = "unnamedplus" -- use clipboard
