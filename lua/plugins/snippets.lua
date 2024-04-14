return {
    'saadparwaiz1/cmp_luasnip',

    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        config = function ()
            local ls = require("luasnip")

            vim.keymap.set({"i", "s"}, "<M-;>", function() ls.expand() end, {silent = true})
            vim.keymap.set({"i", "s"}, "<M-.>", function() ls.jump( 1) end, {silent = true})
            vim.keymap.set({"i", "s"}, "<M-,>", function() ls.jump(-1) end, {silent = true})

            require("luasnip.loaders.from_lua").load({
                paths = "~/.config/nvim/snippets"
            })

        end
    },

}
