local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("keymaps")

require("lazy").setup("plugins")

-- Fetch the GitHub Enterprise URL from the environment variable
local ghe_url = os.getenv("GITHUB_ENTERPRISE_URL")

if ghe_url then
  vim.g.github_enterprise_urls = { ghe_url }
end
