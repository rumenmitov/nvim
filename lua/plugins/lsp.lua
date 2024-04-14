return {

    {
        'nvim-treesitter/nvim-treesitter',
        opts = {
            ensure_installed = {
                "c",
                "cpp",
                "lua",
                "vim",
                "vimdoc",
                "javascript",
                "typescript",
                "html"
            },

            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    },

    'onsails/lspkind.nvim',
    'romgrk/nvim-treesitter-context',

    {
        "williamboman/mason.nvim",
        config = function ()
            require("mason").setup({})
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                'tsserver',
                'rust_analyzer',
                'cssls',
                'clangd',
                'lua_ls',
                'gopls',
                'html'
            },
        }
    },

    'hrsh7th/cmp-buffer',
    'sar/cmp-lsp.nvim',

    {
        'hrsh7th/nvim-cmp',
        config = function ()
            local cmp = require('cmp')
            local lspkind = require('lspkind')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                completion = { completeopt = 'menu,menuone,noinsert' },

                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({select = false}),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                },

                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol_text',
                        maxwidth = 50,
                        ellipsis_char = '...',
                        show_labelDetails = true,
                    })
                },

                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                }, {
                    { name = 'buffer' },
                }),
            })

            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            require('lspconfig')['tsserver'].setup {
                capabilities = capabilities
            }

            require('lspconfig')['gopls'].setup {
                capabilities = capabilities
            }

            require('lspconfig')['clangd'].setup {
                capabilities = capabilities
            }

            require('lspconfig')['cssls'].setup {
                capabilities = capabilities
            }

            require('lspconfig')['rust_analyzer'].setup {
                capabilities = capabilities
            }

            require('lspconfig')['lua_ls'].setup {
                capabilities = capabilities
            }

            require('lspconfig')['html'].setup {
                capabilities = capabilities
            }

            end
    },

    {
        'neovim/nvim-lspconfig',
        config = function ()
            local lspconfig = require('lspconfig')
            lspconfig.clangd.setup({})
            lspconfig.dartls.setup({})
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {
                                'vim',
                                'require'
                            },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                    },
                },
            })

            vim.keymap.set('n', '<space>d', vim.diagnostic.open_float)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gf', vim.lsp.buf.format, {})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {})
            vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, {})
            vim.keymap.set({ 'n', 'v' }, '<space>fx', vim.lsp.buf.code_action, {})

        end
    },


}
