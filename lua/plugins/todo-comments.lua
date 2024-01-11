return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        vim.keymap.set("n", "<leader>td", ":TodoTrouble<CR>", {desc = "[T]oggle To[D]o"})
    },
}
