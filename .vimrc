execute pathogen#infect()
filetype plugin on
filetype plugin indent on
runtime macros/matchit.vim


" ========================================================================
" Vundle stuff
" ========================================================================
set nocompatible " Required by vundle
filetype off     " Required by vundle

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
Plugin 'ParamagicDev/vim-medic_chalk'
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'chaoren/vim-wordmotion'
Plugin 'majutsushi/tagbar'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'rking/ag.vim'
Plugin 'luochen1990/rainbow'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-repeat'
Plugin 'docunext/closetag.vim'
Plugin 'kana/vim-fakeclip'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'leafgarland/typescript-vim'
" Use release branch (Recommend)
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
"python things
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

"NERDTree"
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
set noswapfile
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Comments
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'ag --vimgrep'

"cutom keys"
let mapleader=","
set dir=~/tmp
set clipboard+=unnamedplus
set mouse=a
set switchbuf=usetab
nmap <silent> <Tab> :tabnext<CR>
nmap <silent> <S-Tab> :tabprev<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <silent> <F12> :qa <CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> <Esc>:tabclose<CR>
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

" custom commands
command! Dup :syn clear Repeat | g/^\(.*\)\n\ze\%(.*\n\)*\1$/exe 'syn match Repeat "^' . escape(getline('.'), '".\^$*[]') . '$"' | nohlsearch

if has('macunix')
    " pbcopy for OSX copy/paste
    vmap <C-x> :!pbcopy<CR>
    vmap <C-c> :w !pbcopy<CR><CR>
endif

" UltiSnips triggering
"let g:UltiSnipsExpandTrigger = '<C-j>'
"let g:UltiSnipsJumpForwardTrigger = '<C-j>'
"let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
"let g:UltiSnipsEditSplit="vertical"

" coc.nvim config
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" always show signcolumns
set signcolumn=yes
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> gd <Plug>(coc-definition)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction




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
syntax on
let g:ycm_autoclose_preview_window_after_completion=0
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

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

" Typescript
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" open ctrlp in MRU
let g:ctrlp_cmd = 'CtrlPMRU'

