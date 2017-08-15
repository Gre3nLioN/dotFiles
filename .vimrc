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

Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-surround'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'kien/ctrlp.vim'
Plugin 'cesardeazevedo/Fx-ColorScheme'
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'chaoren/vim-wordmotion'
Plugin 'rking/ag.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Style"
set t_Co=256
set number
set relativenumber
set background=dark
colorscheme fx
autocmd StdinReadPre * let s:std_in=1
runtime macros/matchit.vim

"NERDTree"
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
set noswapfile

"Spark - Emmet"
let g:sparkupExecuteMapping='<C-E>'

"JsBeatify"
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

"cutom keys"
let mapleader=","
set dir=~/tmp
set clipboard=unnamed
set mouse=a
set shiftwidth=4
set tabstop=4
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

" open ag.vim
nnoremap <leader>a :Ag

" jk is escape
inoremap jk <esc>

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" search
let g:ag_working_path_mode="r"
let g:ackprg = 'ag --nogroup --nocolor --column'
