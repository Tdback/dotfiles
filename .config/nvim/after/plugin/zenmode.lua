vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").setup {
        window = {
            width = .70,
            options = {
                signcolumn = "no", -- disable signcolumn
                number = false, -- disable number column
                wrap = true,
                relativenumber = false, -- disable relative numbers
                cursorline = false, -- disable cursorline
                colorcolumn = "0", -- disable cursor column
            }
        },
        plugins = {
            options = {
                enabled = true,
                ruler = false, -- disables the ruler text in the cmd line area
                showcmd = false, -- disables the command in the last line of the screen
            },
            gitsigns = { enabled = false }, -- disables git signs
        }
    }
    require("zen-mode").toggle()
    ColorMyVim()
end)
