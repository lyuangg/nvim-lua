
-- 自定义片段
local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

------------------------------ 
-- golang
------------------------------
ls.add_snippets("go", {
    s("2006", { t("2006-01-02 15:04:05") })
})
ls.add_snippets("go", {
    s("Y-m-d H:i:s", {
        t("2006-01-02 15:04:05"),
    }),
})

ls.add_snippets("go", {
    s("iferr", {
        t("if err != nil "),
        t({ "{", "\t" }),
        i(1, "return err"),
        t({ "\t", "}" }),
        i(0),
    }),
})

ls.add_snippets("go", {
    s("iferrd", {
        t("if err != nil "),
        t({ "{", "\t" }),
        t("l.Errorf(\""),
        i(1, ""),
        t("失败：%v\","),
        i(2, ""),
        t("err)"),
        t({ "", "\t" }),
        t("return nil, "),
        i(3, "defaultErr"),
        t({ "\t", "}" }),
        i(0),
    }),
})

ls.add_snippets("go", {
    s("derr", {
        t("var defaultErr error = errors.New(\""),
        i(1, ""),
        t("失败\")"),
        i(0),
    }),
})

------------------------------ 
-- markdown
------------------------------
ls.add_snippets("markdown", {
    s("··", {
        t("```"),
        i(1, "go"),
        t({ "\t", "```" })
    }),
    s("···", {
        t("```"),
        i(1, "go"),
        t({ "\t", "```" })
    }),
    s("·", {
        t("`"),
        i(1, ""),
        t({ "`" })
    }),
    s("‘", {
        t("'"),
        i(1, ""),
        t({ "'" })
    }),
    s("“", {
        t('"'),
        i(1, ""),
        t('"'),
    }),
    s("《", {
        t("<"),
    }),
    s("》", {
        t(">"),
    }),
})


------------------------------ 
-- filename
------------------------------
local ret_filename = function (args, parent, user_args)
    if user_args == "fname" then
        return vim.fn.expand('%:t:r')
    elseif user_args == "fpath" then
        return vim.fn.expand('%:p')
    elseif user_args == "fdir" then
        return vim.fn.expand('%:p:h')
    else
        return vim.fn.expand('%:t')
    end
end
ls.add_snippets("all", {
    s("fname", {
        f(ret_filename, {}, {user_args={"fname"}})
    })
})
ls.add_snippets("all", {
    s("fpath", {
        f(ret_filename, {}, {user_args={"fpath"}})
    })
})
ls.add_snippets("all", {
    s("fdir", {
        f(ret_filename, {}, {user_args={"fdir"}})
    })
})
ls.add_snippets("all", {
    s("filename", {
        f(ret_filename, {}, {user_args={"filename"}})
    })
})
