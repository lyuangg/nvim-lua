-- 获取当前选中的文本
-- local function get_visual_selection()
--     local selected_text = ''
--     local selected_lines = vim.fn.getline("'<", "'>")
--     local s_start = vim.fn.getpos("'<")
--     local s_end = vim.fn.getpos("'>")

--     if #selected_lines == 1 then
--         selected_text = string.sub(selected_lines[1], s_start[3], s_end[3])
--     else
--         for i, v in ipairs(selected_lines) do
--             if i == 1 then
--                 selected_text = selected_text .. string.sub(v, s_start[3])
--             elseif i == #selected_lines then
--                 selected_text = selected_text .. string.sub(v, 0, s_end[3])
--             else
--                 selected_text = selected_text .. v
--             end
--         end
--     end
--     return selected_text
-- end
local function get_visual_selection()
    local temp = vim.fn.getreg('s')
    vim.cmd('normal! gv"sy')
    local stext = vim.fn.getreg('s')
    vim.fn.setreg('s', temp)
    return stext
end

local function encodeURI(s)
    s = string.gsub(s, "([^%w%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end)
    return string.gsub(s, " ", "+")
end

--------------------------------------------------------------------------------------------
-- gx 打开url
--------------------------------------------------------------------------------------------
-- 获取当前选中的文本, 如果没有选中文本则获取光标下的单词，然后打开浏览器访问该网址
function Open_url(mode)
    local url = vim.fn.expand("<cWORD>")
    if mode == "v"  then
        url = get_visual_selection()
    end
    url = string.gsub(url, '^%p(.*)%p$', '%1')
    if url == "" then
        return
    end
    if url:sub(1, 4) ~= "http" then

        if vim.fn.filereadable(url) == 1 then
            vim.fn.jobstart({ "open", url })
            return
        end

        if string.match(url, '^%w+%.%w+%.%w.+$') then
            url = "http://" .. url
        else
            vim.fn.system('open "https://www.google.com/search?q=' .. encodeURI(url) .. '"')
            return
        end
    end
    vim.fn.jobstart({ "open", url })
end

--------------------------------------------------------------------------------------------
-- gf 打开文件
--------------------------------------------------------------------------------------------
-- 打开选中的文本或光标下的单词对应的文件
function Open_file(mode)
    local file_path = vim.fn.expand("<cfile>")
    if mode == "v"  then
        file_path = get_visual_selection()
    end
    if file_path == "" then
        return
    end
    if vim.fn.filereadable(file_path) == 1 then
        vim.cmd("edit " .. file_path)
        return
    end

    local file_path2 = string.gsub(file_path, "^%.", "")
    file_path2 = vim.fn.expand("%:p:h") .. "/" .. file_path2
    if vim.fn.filereadable(file_path2) == 1 then
        vim.cmd("edit " .. file_path2)
        return
    end

    local file_name = vim.fn.fnamemodify(file_path, ":t")
    local file_path3 = vim.fn.findfile(file_name)
    if file_path3 ~= "" then
        vim.cmd("edit " .. file_path3)
        return
    end

    print("File not found: " .. file_path)
end

--------------------------------------------------------------------------------------------
-- 输入法切换
--------------------------------------------------------------------------------------------
-- 记录当前输入法
Current_input_method = vim.fn.system("/usr/local/bin/macism")
Enable_auto_input_switch = false

-- 切换到英文输入法
function Switch_to_English_input_method()
    Current_input_method = vim.fn.system("/usr/local/bin/macism")
    if Current_input_method ~= "com.apple.keylayout.ABC\n" then
        vim.fn.system("/usr/local/bin/macism com.apple.keylayout.ABC")
    end
end

-- 设置输入法
function Set_input_method()
    if Current_input_method ~= "com.apple.keylayout.ABC\n" then
        vim.fn.system("/usr/local/bin/macism " .. string.gsub(Current_input_method, "\n", ""))
    end
end

-- 进入normal模式时切换为英文输入法
if Enable_auto_input_switch == true then
    vim.cmd([[
    augroup input_method
    autocmd!
    autocmd InsertEnter * :lua Set_input_method()
    autocmd InsertLeave * :lua Switch_to_English_input_method()
    augroup END
    ]])
end
