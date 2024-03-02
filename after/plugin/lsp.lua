local lsp = require("lsp-zero")
local lsp_config = require("lspconfig")

lsp.preset("recommended")

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',
        'rust_analyzer',
        'eslint',
        'cssls',
        'clangd',
        'gopls',
        'html',
    },
    handlers = {
        lsp.default_setup,
    },
})

lsp_config["dartls"].setup({})

lsp_config.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          'vim',
          'require'
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
}

lsp.setup()

local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
  -- Add borders around the popup window
  window = {
    completion = cmp.config.window.bordered(),
  },

  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  },

  formatting = {
      format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '...',
          show_labelDetails = true,
      })
  }
})
