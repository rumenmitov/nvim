-- General
	vim.opt.updatetime = 50
	vim.opt.scrolloff = 5
	vim.opt.laststatus = 2

-- Line numbers
	vim.opt.nu = true
	vim.opt.rnu = true

-- Indenting
	vim.opt.tabstop = 4
	vim.opt.softtabstop = 4
	vim.opt.shiftwidth = 4
	vim.opt.expandtab = true
	vim.opt.smartindent = true

-- Wrap
  vim.opt.wrap = true
  vim.opt.colorcolumn = "80"

-- Search
	vim.opt.hlsearch = false
	vim.opt.incsearch = true

-- Version control
  vim.opt.swapfile = false
  vim.opt.backup = false
  vim.opt.undodir = "/home/rumen/.vim/undodir"
  vim.opt.undofile = true

-- Colorscheme
  vim.opt.background = "dark"
	vim.cmd.colorscheme("everforest")
	vim.opt.termguicolors = true
