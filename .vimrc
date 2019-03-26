execute pathogen#infect()
syntax on
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
Plugin 'cesardeazevedo/Fx-ColorScheme'
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'chaoren/vim-wordmotion'
Plugin 'rking/ag.vim'
Plugin 'luochen1990/rainbow'
Plugin 'tpope/vim-commentary'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-repeat'
Plugin 'docunext/closetag.vim'
Plugin 'kana/vim-fakeclip'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Style"
set t_Co=256
set number
set relativenumber
set background=dark
colorscheme fx
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

"
" Options
"
set backspace=2             " in order to delete in insert mode
set autoindent              " Carry over indenting from previous line
set cinkeys-=0#             " Comments don't fiddle with indenting
set copyindent              " Make autoindent use the same chars as prev line
set encoding=utf8           " UTF-8 by default
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'ag --vimgrep'

"cutom keys"
let mapleader=","
set dir=~/tmp
set clipboard=unnamed
set mouse=a
set switchbuf=usetab
nmap <silent> <Tab> :tabnext<CR>
nmap <silent> <S-Tab> :tabprev<CR>
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
nnoremap <Leader>s :w <CR>
noremap } ;
noremap ] ,
nnoremap<Leader>m ]` 
nnoremap <Leader>l [`
xnoremap p pgvy


if has('macunix')
    " pbcopy for OSX copy/paste
    vmap <C-x> :!pbcopy<CR>
    vmap <C-c> :w !pbcopy<CR><CR>
endif

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsEditSplit="vertical"
