return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {},
        },
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },

    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()

        vim.diagnostic.config({
            virtual_text = true, -- Enable inline diagnostics
            signs = true,        -- Enable gutter icons
            -- update_in_insert = true,
            float = {
                border = "rounded",
                source = true,
                header = "",
                prefix = "",
            },
        })
    end
}
