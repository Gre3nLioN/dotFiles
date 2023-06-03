local g   = vim.g
local cmd = vim.cmd


g.gitblame_enabled = 1
g.gitblame_date_format = '%x'
g.gitblame_message_template = '<summary> • <author> • <date>'
g.mouse = a
g.ttymouse = xterm2

cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys

cmd('set ts=2')
cmd('set sw=2')
cmd('set expandtab')


cmd('set clipboard=unnamed')
cmd('set foldmethod=indent')
cmd('set foldlevel=99999')
cmd('set nobackup')
cmd('set nowritebackup')
cmd('set noswapfile')


cmd('set synmaxcol=2048')




-- colorscheme

cmd("syntax enable")
cmd("syntax on")
cmd('set colorcolumn=99999') -- fix indentline for now

cmd('let g:nvcode_termcolors=256')
cmd('colorscheme ' .. O.colorscheme)

-- ignore
--
cmd('set wildignore+=*/tmp/*,*.o,*.so,*.swp,*.zip,*/node_modules/*,*/dist/*,*/test/*,*/logs/*')
cmd('set wildignore+=*/node_modules/**')
cmd('set wildignore+=*node_modules**')
cmd('set wildignore+=*/dist/**')
cmd('set wildignore+=*dist**')

-- ALE

cmd('highlight clear ALEErrorSign')
cmd('highlight clear ALEWarningSign')

g.ale_sign_error = "💣"
g.ale_sign_warning = "⚠️"
g.ale_fix_on_save = 1
g.ale_lint_on_save = 1
g.ale_linters_explicit = 0
g.ale_sign_column_always = 1
g.ale_open_list = 0
g.ale_virtualtext_cursor = 1
g.ale_virtualtext_prefix = '<| '

g.ale_fixers = {
  javascript = { 'eslint', 'prettier' },
  css = { 'prettier' }
}

g.ale_linters = {
  javascript = { 'flow', 'eslint' }
}

-- better whitespace
g.better_whitespace_guicolor = '#ff7b72'
g.better_whitespace_skip_empty_lines = 1


-- TMUX
g.tmux_navigator_disable_when_zoomed = 1

-- emmet
g.user_emmet_leader_key = '<C-Z>'

-- Ack (ripgrep)
cmd('cnoreabbrev Ack Ack!')
cmd([[let g:ackprg = 'rg -S --no-heading --vimgrep']])

cmd([[let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git, node_modules, dist, test, logs -g ""']])
cmd([[set grepprg=ag\ --nogroup\ --nocolor]])

cmd('set scrolloff=10')
