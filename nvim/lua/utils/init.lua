local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= "o" then
        scopes["o"][key] = value
    end
end

opt("o", "hidden", true)
opt("o", "incsearch", true)
opt("o", "smartcase", true)
opt("o", "ignorecase", true)
opt("o", "splitbelow", true)
opt("o", "splitright", true)
opt("o", "termguicolors", true)
opt("w", "number", true)
opt("o", "numberwidth", 2)
opt("w", "wrap", false) -- display long lines as just one line


opt("o", "mouse", "a")

opt("w", "signcolumn", "yes")
opt("o", "cmdheight", O.cmdheight)
opt("o", "pumheight", 10) -- makes popup menu smaller
opt("o", "fileencoding", "utf-8") -- the encoding written to file


-- opt("o", "t_Co", "256") -- support 256 colors
opt("o", "conceallevel",  0) -- so that I can see `` in markdown files


opt("b", "expandtab", true) -- converts tabs to spaces
opt("b", "smartindent", true) -- makes indenting smart
opt("w", "number", true) -- set numbered lines
opt("w", "relativenumber", O.relative_number)
opt("w", "cursorline", true) -- enable highlighting of the current line
opt("o", "showtabline", 2) -- always show tabs
opt("o", "showmode", false) -- we don't need to see things like -- INSERT -- anymore

opt("o", "backup", false) -- this is recommended by coc
opt("o", "writebackup", false) -- this is recommended by coc

opt("o", "timeoutlen", 1000) -- by default timeoutlen is 1000 ms
opt("o", "guifont", "JetBrainsMono\\ Nerd\\ Font\\ Mono:h18")

opt("o", "updatetime", 250) -- update interval for gitsigns
opt("o", "clipboard", "unnamedplus")

-- for indenline
opt("b", "shiftwidth", 2 )


local M = {}

function M.is_buffer_empty()
    -- Check whether the current buffer is empty
    return vim.fn.empty(vim.fn.expand("%:t")) == 1
end

function M.has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end

return M
