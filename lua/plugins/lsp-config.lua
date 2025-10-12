return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer", "gopls" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.rust_analyzer.setup({
                settings = {
                    ["rust_analyzer"] = {
                        cargo = { allFeatures = true },
                        check = { command = "clippy" },
                        rustfmt = true,
                    },
                },

                capabilities = capabilities,
            })

            lspconfig.gopls.setup({
                settings = {
                    gopls = {
                        gofumpt = true,
                        staticcheck = true,
                    },
                },

                flags = {
                    debounce_text_changes = 150,
                },

                capabilities = capabilities,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
