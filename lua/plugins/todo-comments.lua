return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
        local todo = require("todo-comments")
        vim.keymap.set("n", "]t", function()
            todo.jump_next()
        end, { desc = "Next [T]odo comment" })

        vim.keymap.set("n", "[t", function()
            todo.jump_prev()
        end, { desc = "Previous [T]odo comment" })

        -- You can also specify a list of valid jump keywords

        vim.keymap.set("n", "]te", function()
            todo.jump_next({ keywords = { "ERROR" } })
        end, { desc = "[N]ext [E]rror" })
    end

}
