return {
    "zbirenbaum/copilot.lua",
    enabled = true,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        local copilot = require("copilot")
        copilot.setup({
            suggestion = {
                auto_trigger = true,
                hide_during_completion = false,
                debounce = 25,
            },
        })

        local suggestionn = require("copilot.suggestion")

        vim.keymap.set({ "i" }, "<Tab>", function()
            if suggestionn.is_visible() then
                suggestionn.accept_line()
            else
                return "<Tab>"
            end
        end, { expr = true, silent = true })

        vim.keymap.set({ "i" }, "<S-Tab>", function()
            if suggestionn.is_visible() then
                suggestionn.accept()
            else
                return "<S-Tab>"
            end
        end, { expr = true, silent = true })
    end,
}
