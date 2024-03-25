return {

 -- Dashboard
 {
   'goolord/alpha-nvim',
   dependencies = { 'nvim-tree/nvim-web-devicons' },
 },

 -- File manager
 'prichrd/netrw.nvim',

 -- Fuzzy finder
 {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
 },

 -- Icons
 'kyazdani42/nvim-web-devicons',
 'onsails/lspkind.nvim',

 -- Colorscheme
 'sainnhe/everforest',
 'shaunsingh/nord.nvim',
 'navarasu/onedark.nvim',
 'Mofiqul/dracula.nvim',
 'morhetz/gruvbox',

 -- Version control
 'mbbill/undotree',

 -- Statusline
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
},

 -- Notifications
 'rcarriga/nvim-notify',

 -- Command Line
 {
     'VonHeikemen/fine-cmdline.nvim',
     dependencies = { 'MunifTanjim/nui.nvim' }
 },

 -- Smooth scroll
 'karb94/neoscroll.nvim',

 -- Syntax highlighting
 {
     'nvim-treesitter/nvim-treesitter',
 },

 -- Context
 'romgrk/nvim-treesitter-context',

 -- Autocompletion
{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
{'neovim/nvim-lspconfig'},
{"williamboman/mason.nvim"},
{"williamboman/mason-lspconfig.nvim"},
{'hrsh7th/cmp-nvim-lsp'},
{'hrsh7th/nvim-cmp'},

{
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp"
},

{'saadparwaiz1/cmp_luasnip'},

 -- Comments
 'tpope/vim-commentary',

 -- Git
 {
   'airblade/vim-gitgutter',
   branch = "main"
 },

 -- Boilerplate
 'mattn/emmet-vim',

 -- Color Preview
 'brenoprata10/nvim-highlight-colors',

 -- Autopairs
 "windwp/nvim-autopairs",

 -- Vim surround
 'tpope/vim-surround',

 -- AsciiDoc preview
 {
  'tigion/nvim-asciidoc-preview',
  cmd = { 'AsciiDocPreview' },
  ft = { 'asciidoc' },
  build = 'cd server && npm install',
},

 -- Comments
 "Djancyp/better-comments.nvim",


 -- Notes (Neorg + Vim Tables)
 {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    lazy = false, -- specify lazy = false because some lazy.nvim distributions set lazy = true by default
    dependencies = { "nvim-lua/plenary.nvim" },
 },

 'dhruvasagar/vim-table-mode',

 }
