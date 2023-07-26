function Run()
    vim.cmd("w")
    local path = vim.fn.getcwd() .. '/run.sh'
    if vim.fn.filereadable(path) ~= 0 then
        vim.cmd("bo 20split term://" .. path)
        return
    end

    if vim.bo.filetype == 'markdown' then
        -- local fpath = "!open -a 'Google Chrome' " .. vim.fn.fnameescape(vim.fn.expand("%"))
        -- vim.cmd(fpath)
        vim.cmd("MarkdownPreview")
    elseif vim.bo.filetype == 'javascript' then
        -- vim.cmd("bo 20split term://node " .. vim.fn.fnameescape(vim.fn.expand("%")))
        vim.cmd("!node " .. vim.fn.expand("%"))
    elseif vim.bo.filetype == 'php' then
        ShowCmdResultInSplit('php ' .. vim.fn.expand("%"))
        -- vim.cmd("bo 20split term://php " .. vim.fn.fnameescape(vim.fn.expand("%")))
    elseif vim.bo.filetype == 'go' then
        vim.cmd("!go run " .. vim.fn.expand("%"))
        -- vim.cmd("bo 20split term://go run %"")
    elseif vim.bo.filetype == 'python' then
        vim.cmd("bo 20split term://python3 %")
    elseif vim.bo.filetype == 'html' then
        vim.cmd("!open -a 'Google Chrome' " .. vim.fn.expand("%"))
    elseif vim.bo.filetype == 'sh' then
        -- vim.cmd("!time bash %")
        vim.cmd("bo 20split term://time bash %")
    end
end

function ShowCmdResultInSplit(cmd)
    vim.o.splitbelow = true
    vim.cmd("split [execute_result]")
    vim.cmd("normal! ggdG")
    vim.bo.filetype = "executeresult"
    vim.bo.buftype = "nofile"
    vim.api.nvim_buf_set_keymap(0, "n", "q", ":bd<CR>", {silent = true})
    vim.cmd("resize 15")
    vim.cmd("highlight MyGroup guifg=orange")
    vim.cmd("highlight MyGroup2 guifg=grey")
    vim.cmd("match MyGroup /\\[CMD\\]/")
    vim.cmd("2match MyGroup2 /Type\\ q\\ to\\ quit!/")
    vim.api.nvim_buf_set_lines(0, 0, 0, false, {'[CMD] ' .. cmd})
    vim.api.nvim_buf_set_lines(0, 1, 1, false, vim.fn.split(vim.fn.system(cmd), '\v\n'))
    vim.api.nvim_put({'Type q to quit!'}, '', true, true)
end

vim.api.nvim_set_keymap('n', '<leader>r', ':lua Run()<CR>', {noremap = true})
