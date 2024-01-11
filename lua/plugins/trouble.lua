return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        vim.keymap.set("n", "<leader>tt", function() require("trouble").toggle() end, { desc = "[T]oggle [T]rouble" })
    },
}
