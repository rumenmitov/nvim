return {
    'tpope/vim-commentary',
    'airblade/vim-gitgutter',
    'tpope/vim-surround',

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

    {
        'tigion/nvim-asciidoc-preview',
        cmd = { 'AsciiDocPreview' },
        ft = { 'asciidoc' },
        build = 'cd server && npm install',
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },

}
