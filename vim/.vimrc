set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'hugolgst/vimsence'
Plugin 'jiangmiao/auto-pairs'
Plugin 'sheerun/vim-polyglot'
Plugin 'ayu-theme/ayu-vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

function! Reload_window_runner()
    " clears all buffers and reopens the last used one and nerd tree
    " see if you could maybe only clear the terminal
    execute "w|%bd!|e#|NERDTree"
    " brings the cursor back to the main window
    normal!  
endfunction 

function! PY_runner()
    call Reload_window_runner()
    let py_current_file_path_runner = expand("%")
    let py_current_file_runner = ":w\<CR>:bel term\<CR>python3 " . py_current_file_path_runner . "\<CR>"
    call feedkeys(py_current_file_runner)
    " brings the cursor back to the window of the file and sets a nice window
    " size
    call feedkeys(":resize 30\<CR>")
endfunction

function! JAVA_runner() 
    call Reload_window_runner()
    let java_current_file_path_runner = expand("%:r")
    let java_current_file_runner = ":w\<CR>:bel term\<CR>javac " . java_current_file_path_runner . ".java && java " . java_current_file_path_runner . "\<CR>"
    call feedkeys(java_current_file_runner)
    " brings the cursor back to the window of the file
    call feedkeys(":resize 30\<CR>")
endfunction

command! CloseAll execute ":w|%bd!|x"

map <F2> :CloseAll<CR>

autocmd FileType python nnoremap <buffer> <C-r> :call PY_runner()<CR>
autocmd FileType java  nnoremap <buffer> <C-r> :call JAVA_runner()<CR>

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}

command! Config execute ":e $MYVIMRC"

syntax on

" let ayucolor="mirage"
colorscheme nord

set tabstop=4 shiftwidth=4 expandtab

set ttymouse=sgr
set autoindent
set smartindent
set title
set showcmd
set showmatch
set autowrite
set number

hi Folded guibg=NONE

set laststatus=2
set noshowmode

let g:airline_theme='nord'
let g:airline#extensions#tabline#enabled = 1

set hlsearch
set ignorecase
set incsearch
let &t_ut=''
set mouse=a
