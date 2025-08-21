local servers = {
    "lua_ls",               -- Lua
    "pylsp",                -- Python
    "rust_analyzer"         -- Rust
}

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = servers,
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Lua LSP configuration
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            })

            -- Python LSP configuration
            lspconfig.pylsp.setup({ capabilities = capabilities })

            -- Rust LSP configuration
            lspconfig.rust_analyzer.setup({ capabilities = capabilities })

            require("mason").setup()
            require("mason-lspconfig").setup()

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "[d", function()
                        vim.diagnostic.jump({ count = -1 })
                    end, opts)
                    vim.keymap.set("n", "]d", function()
                        vim.diagnostic.jump({ count = 1 })
                    end, opts)
                    vim.keymap.set("n", "<C-w>d", vim.diagnostic.open_float, opts)
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                end
            })
        end
    }
}
