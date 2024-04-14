local ls = require("luasnip")

S = ls.snippet
T = ls.text_node
I = ls.insert_node
F = ls.function_node

function Copy(args)
    return args[1]
end

function ParseArgs(args)
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

return {
    S("docfn", {
        T("/**"),
        T({"", " * @brief "}),
        I(5, "Function description 📖"),
        F(ParseArgs, 3),
        T({"", " * "}),
        T({"", " * @return "}),
        F(Copy, 1),
        T({"" , "*/", ""}),
        I(1, "void"),                   -- return type
        T(" "),
        I(2),                           -- function name
        T("("),
        I(3, "void"),                   -- parameters
        T(") {"),
        T({"", "\t"}),
        I(4, "// Function body 🏋️"),    -- function body
        T({"", "}", ""}),
        I(0)
    }),

    S("docclass", {
        T("/**"),
        T({"", " * @brief "}),
        I(4, "Class description 📖"),
        T({"" , "*/", ""}),
        T("class "),
        I(1),
        T({" {", "", ""}),
        T({"\tpublic:", "\t\t"}),
        T({"// Default constructor", "\t\t"}),
        F(Copy, 1),
        T({"();", "", "\t\t"}),
        T({"// Default destructor", "\t\t"}),
        T("~"),
        F(Copy, 1),
        T({"();", "", "\t\t"}),
        I(2, "// Public body 🌐"),
        T({"", "", "\tprivate:", "\t\t"}),
        I(3, "// Private body 🕵️"),
        T({"", "", "};", ""}),
        I(0)
    }),

    S("doccon", {
        T("/**"),
        T({"", " * @brief "}),
        F(Copy, 1),
        T({" constructor 🏗️"}),
        F(ParseArgs, 2),
        T({"", " * "}),
        T({"" , "*/", ""}),
        I(1),                           -- class name
        T("("),
        I(2, "void"),                   -- parameters
        T({");", ""}),
        I(0)

    }),


    S("mainn", {
        T("int main(int argc, char* argv[]) {"),
        T({"", "\t"}),
        I(1),
        T({"", "\treturn 0;", "}"}),
        T(""),
        I(0)
    })
}
