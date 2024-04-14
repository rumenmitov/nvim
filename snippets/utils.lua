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
