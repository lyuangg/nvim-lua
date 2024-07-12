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
        t("return "),
        i(1, "err"),
        t({ "\t", "}" }),
        i(0),
    }),
})

ls.add_snippets("go", {
    s("iferr2", {
        t("if err != nil "),
        t({ "{", "\t" }),
        t("return "),
        i(1, "nil"),
        t(", "),
        i(2, "err"),
        t({ "\t", "}" }),
        i(0),
    }),
})

ls.add_snippets("go", {
    s("iferrf", {
        t("if err != nil "),
        t({ "{", "\t" }),
        t("return fmt.Errorf(\""),
        i(1, "%v"),
        t("\", "),
        i(2, "err"),
        t(")"),
        t({ "\t", "}" }),
        i(0),
    }),
})

ls.add_snippets("go", {
    s("iferrf2", {
        t("if err != nil "),
        t({ "{", "\t" }),
        t("return nil, fmt.Errorf(\""),
        i(2, "%v"),
        t("\", "),
        i(3, "err"),
        t(")"),
        t({ "\t", "}" }),
        i(0),
    }),
})

ls.add_snippets("go", {
    s("iferrw", {
        t("if err != nil "),
        t({ "{", "\t" }),
        t("return "),
        i(1, "nil"),
        t(", "),
        t("utils.WrapErr(\""),
        i(2, "失败"),
        t("\", "),
        i(3, "err"),
        t(")"),
        t({ "\t", "}" }),
        i(0),
    }),
})

ls.add_snippets("go", {
    s("iferrn", {
        t("if err != nil "),
        t({ "{", "\t" }),
        t("return "),
        i(1, "nil"),
        t(", "),
        t("utils.NewBizErrf(\""),
        i(2, "失败"),
        t("\", \""),
        i(3, "%w"),
        t("\", "),
        i(4, "err"),
        t(")"),
        t({ "\t", "}" }),
        i(0),
    }),
})

ls.add_snippets("go", {
    s("isq", {
        t('	sq "github.com/Masterminds/squirrel"'),
        i(0),
    })
})
ls.add_snippets("go", {
    s("we", {
        t("utils.WrapErr2("),
        i(1, "err"),
        t(")"),
        i(0),
    })
})


------------------------------
-- filename
------------------------------
local ret_filename = function(args, parent, user_args)
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
        f(ret_filename, {}, { user_args = { "fname" } })
    })
})
ls.add_snippets("all", {
    s("fpath", {
        f(ret_filename, {}, { user_args = { "fpath" } })
    })
})
ls.add_snippets("all", {
    s("fdir", {
        f(ret_filename, {}, { user_args = { "fdir" } })
    })
})
ls.add_snippets("all", {
    s("filename", {
        f(ret_filename, {}, { user_args = { "filename" } })
    })
})
