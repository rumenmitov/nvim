return {

    {
        'prichrd/netrw.nvim',
        config = function ()
            require('netrw').setup {
                icons = {
                    symlink = '',
                    directory = '📁',
                    file = '📄',
                },
                use_devicons = true,
            }
        end
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function ()
            local telescope = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
            vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
            vim.keymap.set('n', '<leader>fc', telescope.colorscheme, {})
            vim.keymap.set("n", '<leader>fr', telescope.marks, {})
        end

    },

    {
        'mbbill/undotree',
        config = function ()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },


}
