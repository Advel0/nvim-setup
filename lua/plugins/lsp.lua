return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require('lspconfig').lua_ls.setup { capabilities = capabilities }
            require('lspconfig').pylsp.setup {capabilities = capabilities}
            require('lspconfig').ts_ls.setup {
                capabilities = capabilities,
                filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
                cmd = { "typescript-language-server", "--stdio" },
                -- Optionally disable tsserver formatting if you use prettier or eslint for formatting:
                on_attach = function(client, bufnr)
                    client.server_capabilities.documentFormattingProvider = false
                end,
            }
        end,
    }
}
