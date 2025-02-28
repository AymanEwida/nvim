return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            show_end_of_buffer = false,

            custom_highlights = function(colors)
                return {
                    Normal = { bg = "#000000" }, 
                    NormalNC = { bg = "#000000" },
                    EndOfBuffer = { fg = "#000000" },

                    -- Telescope
                    TelescopeNormal = { bg = "#000000" },
                    TelescopeBorder = { fg = "#ffffff", bg = "#000000" }, 

                    TelescopePromptNormal = { bg = "#000000" },
                    TelescopePromptBorder = { fg = "#ffffff", bg = "#000000" },

                    TelescopeResultsNormal = { bg = "#000000" },
                    TelescopeResultsBorder = { fg = "#ffffff", bg = "#000000" },

                    TelescopePreviewNormal = { bg = "#000000" },
                    TelescopePreviewBorder = { fg = "#ffffff", bg = "#000000" },
                }
            end,
        })

        vim.cmd.colorscheme "catppuccin"
    end
}


