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
    'gopls'
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
          mode = 'symbol_text', -- show only symbol annotations
          maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          -- can also be a function to dynamically calculate max width such as 
          -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
          ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          show_labelDetails = true, -- show labelDetails in menu. Disabled by default
      })
  }
})

