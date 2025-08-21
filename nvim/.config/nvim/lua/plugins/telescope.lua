return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim"
    },
    config = function()
        require("telescope").setup({
            defaults = {
                find_command = {"fd", "--type=file", "--follow"},
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden"
                },
                file_ignore_patterns = {
                    "venv/",
                    "__pycache__/",
                    "%.git"
                }
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {}
                }
            }
        })

        require("telescope").load_extension("ui-select")

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', "<Cmd>Telescope find_files hidden=true<CR>", {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    end
}
