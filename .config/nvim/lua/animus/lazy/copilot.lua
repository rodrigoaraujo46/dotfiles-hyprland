return {
    "zbirenbaum/copilot.lua",
    enabled = true,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            suggestion = {
                auto_trigger = true,
                hide_during_completion = false,
                debounce = 25,
                keymap = {
                    accept = "<leader>C",
                    accept_word = false,
                    accept_line = "<leader>c",
                    next = false,
                    prev = false,
                    dismiss = false,
                },
            },
        })
    end,
}
