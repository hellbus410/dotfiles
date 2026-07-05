vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.undofile = true
vim.opt.confirm = true
vim.opt.mouse = ""

vim.pack.add({
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/tpope/vim-sleuth",
	"https://github.com/folke/which-key.nvim",
})

require("gitsigns").setup()
require("which-key").setup()
