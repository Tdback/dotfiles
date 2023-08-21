require("td.set")
require("td.remap")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local TdGroup = augroup('td', {})
local yank_group = augroup('HighlightYank', {})
local spell_group = augroup('Spellcheck', {})


autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = TdGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd({ "BufRead", "BufNewFile" }, {
    group = spell_group,
    pattern = { "*.md", "*.txt" },
    command = "setlocal spell",
})

-- minimal netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
