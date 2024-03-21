--[[
 _   ___     _____ __  __    ____ ___  _   _ _____ ___ ____
| \ | \ \   / /_ _|  \/  |  / ___/ _ \| \ | |  ___|_ _/ ___|
|  \| |\ \ / / | || |\/| | | |  | | | |  \| | |_   | | |  _
| |\  | \ V /  | || |  | | | |__| |_| | |\  |  _|  | | |_| |
|_| \_|  \_/  |___|_|  |_|  \____\___/|_| \_|_|   |___\____|

]]--

-- Vim options

vim.opt.number = true -- enables numbers on the left
vim.opt.mouse = 'a' -- enables mouse for all things
vim.opt.ignorecase = true -- inogre case on search
vim.opt.smartcase = true -- inogre case until the query has a uppercase
vim.opt.breakindent = true -- the wrapped text is indented to the same level of the line
vim.opt.tabstop = 4 -- how many characters does a tab occupy
vim.opt.shiftwidth = 4 -- with how many characters nvim will indent a line
vim.opt.expandtab = true -- Nvim will use spaces instead of tabs
vim.opt.clipboard = "unnamedplus" -- Yank to system clipboard
vim.opt.termguicolors = true -- 24bit rgb colors in the tui
vim.opt.colorcolumn = "100" -- Set max column width marker
vim.opt.mousemoveevent = true -- Enable mouse move events

-- install lazy.nvim (if needed)
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

require "plugins"
require "colors"
require "mappings"


