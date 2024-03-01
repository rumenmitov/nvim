-- Formatting
function Format()
    vim.api.nvim_input("gg0VG==g;g;")
end

-- Pretty (formatter for Prettier) 
function Pretty()
    vim.cmd('!pretty "%"')
end

-- Line wrapping
function LineWrap(line_width)
    local command = '!fold -s % > /tmp/nvim_wrap && cat /tmp/nvim_wrap > % && rm /tmp/nvim_wrap'

    if line_width then
        command = '!fold -s -w ' .. line_width .. ' % > /tmp/nvim_wrap && cat /tmp/nvim_wrap > % && rm /tmp/nvim_wrap'
    end

    vim.cmd(command)
end
