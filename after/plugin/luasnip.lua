local ls = require("luasnip")

vim.keymap.set({"i", "s"}, "<M-3>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<M-1>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<M-2>", function() ls.jump(-1) end, {silent = true})

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function copy(args)
	return args[1]
end

local function parseArgs(args)
    if args[1][1] == "void" then
        return {""}
    end

    local res = {"", " * "}
    local args_arr = vim.split(args[1][1], ", ")

    local bracket_cout = 0;
    local current_param = "";

    for _, arg in ipairs(args_arr) do
        for char in arg:gmatch"." do
            if char == "<" then
                bracket_cout = bracket_cout + 1;
            end

            if char == ">" then
                bracket_cout = bracket_cout - 1;
            end
        end

        if bracket_cout ~= 0 then
            current_param = current_param .. arg .. ", "
        else
            current_param = current_param .. arg
            vim.list_extend(res, {" * @param " .. current_param});
            current_param = ""
        end
    end

    return res
end

ls.add_snippets("cpp", {
    s("docfn", {
        t("/**"),
        t({"", " * @brief "}),
        i(5, "Function description 📖"),
        f(parseArgs, 3),
        t({"", " * "}),
        t({"", " * @return "}),
        f(copy, 1),
        t({"" , "*/", ""}),
        i(1, "void"),                   -- return type
        t(" "),
        i(2),                           -- function name
        t("("),
        i(3, "void"),                   -- parameters
        t(") {"),
        t({"", "\t"}),
        i(4, "// Function body 🏋️"),    -- function body
        t({"", "}", ""}),
        i(0)
    }),

    s("docclass", {
        t("/**"),
        t({"", " * @brief "}),
        i(4, "Class description 📖"),
        t({"" , "*/", ""}),
        t("class "),
        i(1),
        t({" {", "", ""}),
        t({"\tpublic:", "\t\t"}),
        t({"// Default constructor", "\t\t"}),
        f(copy, 1),
        t({"();", "", "\t\t"}),
        t({"// Default destructor", "\t\t"}),
        t("~"),
        f(copy, 1),
        t({"();", "", "\t\t"}),
        i(2, "// Public body 🌐"),
        t({"", "", "\tprivate:", "\t\t"}),
        i(3, "// Private body 🕵️"),
        t({"", "", "};", ""}),
        i(0)
    }),

    s("doccon", {
        t("/**"),
        t({"", " * @brief "}),
        f(copy, 1),
        t({" constructor 🏗️"}),
        f(parseArgs, 2),
        t({"", " * "}),
        t({"" , "*/", ""}),
        i(1),                           -- class name
        t("("),
        i(2, "void"),                   -- parameters
        t({");", ""}),
        i(0)

    })
})

