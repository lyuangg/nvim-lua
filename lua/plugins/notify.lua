return {
    'rcarriga/nvim-notify',
    lazy = true,
	event = "VeryLazy",
    config = function()
        local notify = require("notify")

        notify.setup({
            timeout = 3000,
        })

        vim.notify = notify
    end
}
