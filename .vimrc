filetype plugin on
filetype plugin indent on
runtime macros/matchit.vim


" ========================================================================
" Vundle stuff
" ========================================================================
set nocompatible " Required by vundle
filetype off     " Required by vundle
syntax on
" syntax sync fromstart
" syntax sync minlines=1000
" set synmaxcol=0
" set redrawtime=1000
set noswapfile
" try to fix syntax issues
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256
set synmaxcol=200
autocmd BufEnter * :syn sync maxlines=500

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-surround'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'ParamagicDev/vim-medic_chalk' " theme
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'chaoren/vim-wordmotion'
Plugin 'majutsushi/tagbar'
Plugin 'universal-ctags/ctags'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'rking/ag.vim'
Plugin 'luochen1990/rainbow'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-repeat'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'dense-analysis/ale'
" Plugin 'ycm-core/YouCompleteMe'
" Plugin 'docunext/closetag.vim'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
" Use release branch (Recommend)
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" Plugin 'neoclide/coc-highlight', {'branch': 'release'}
" Plugin 'neoclide/coc-tabnine', {'branch': 'release'}
" coc-snippets
"python things
Plugin 'SkyLeach/pudb.vim'
Plugin 'tmhedberg/SimpylFold'
"Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Style"
set t_Co=256
set number
set relativenumber
set background=dark
colorscheme medic_chalk
:hi TabLineFill ctermfg=241 ctermbg=241
:hi TabLine ctermfg=231 ctermbg=233
:hi TabLineSel ctermfg=214 ctermbg=172
autocmd StdinReadPre * let s:std_in=1
runtime macros/matchit.vim
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle


" ctags config
set statusline+=%{gutentags#statusline()}
let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "*.vim/bundle/*"]

"NERDTree"
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Comments
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Tell ack.vim to use ag (the Silver Searcher) instead
" let g:ackprg = 'ag --vimgrep'
let g:ackprg = 'ag --nogroup --nocolor --column'
" to find on the root git directory
function! Find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! -nargs=1 Ag execute "Ack! <args> " . Find_git_root()

"cutom keys"
let mapleader=","
set dir=~/tmp
" set clipboard+=unnamedplus
set clipboard=unnamed
set mouse=a
set switchbuf=usetab
nmap <silent> <Tab> :tabnext<CR>
nmap <silent> <S-Tab> :tabprev<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <silent> <F12> :qa <CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> <Esc>:tabclose<CR>
" stupid touchbar T_T
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kj <Esc>
inoremap kk <Esc>
nnoremap <C-a> ggVG <CR>
nnoremap <C-Fin> $ <CR>
nnoremap <C-k> <C-w><Up>
nnoremap <C-j> <C-w><Down>
nnoremap <C-l> <C-w><Right>
nnoremap <C-h> <C-w><Left>
nnoremap <silent> <Leader>+ :exe "10winc >"<CR>
nnoremap <silent> <Leader>- :exe "10winc <"<CR>
nnoremap <silent> <Leader>p :exe "%!jq '.'"<CR>
nnoremap <silent> <Leader>n :RecentNotes<CR>
nnoremap <Leader>s :w <CR>
noremap } ;
noremap ] ,
nnoremap<Leader>m ]`
nnoremap <Leader>l [`
xnoremap p pgvy

" custom commands , remove duplicated
command! Dup :syn clear Repeat | g/^\(.*\)\n\ze\%(.*\n\)*\1$/exe 'syn match Repeat "^' . escape(getline('.'), '".\^$*[]') . '$"' | nohlsearch

" coc.nvim config
" function! s:check_back_space() abort
	" let col = col('.') - 1
	" return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <TAB>
			" \ pumvisible() ? "\<C-n>" :
			" \ <SID>check_back_space() ? "\<TAB>" :
			" \ coc#refresh()
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=400
" always show signcolumns
set signcolumn=yes
" Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
  " if (index(['vim','help'], &filetype) >= 0)
    " execute 'h '.expand('<cword>')
  " else
    " call CocAction('doHover')
  " endif
" endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Python things
autocmd BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

let python_highlight_all=0
let g:SimpylFold_docstring_preview=0


"
" Options
"
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set fileformat=unix

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
" Nvim python environment settings
if has('nvim')
  let g:python_host_prog='~/.pyenv/versions/3.6.0/bin/python'
  let g:python3_host_prog='~/.pyenv/versions/3.6.0/bin/python'
	let g:pudb_python='~/.pyenv/versions/3.6.0/bin/python'
  let g:pudb_breakpoint_symbol='☠'
endif


" open ctrlp in MRU
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_cmd = 'CtrlP :pwd'
let g:ctrlp_max_files=0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules|dist|dist-watch|test|local_modules|logs|doc|external_services|release|notebooks|proto)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

nnoremap <leader>. :CtrlPTag<cr>



" Javascript linter
nmap <leader>d <Plug>(ale_fix)
let g:jsx_ext_required = 0

let g:ale_linters = {
\   'javascript': ['standard'],
\}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
