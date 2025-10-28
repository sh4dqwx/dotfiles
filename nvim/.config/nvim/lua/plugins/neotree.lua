return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,
    config = function()
        require("neo-tree").setup({
            filesystem = {
                follow_current_file = {
                    enabled = true
                },
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = true
                }
            }
        })

        vim.keymap.set("n", "<leader>e", "<Cmd>Neotree<CR>")
    end
}
