set nocompatible		"required for VundleVim
filetype off			"required for VundleVim

"PLUGINS SHOULD BE BETWEEN vundle#begin/end

" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'w0rp/ale'

" Colorscheme
Plugin 'morhetz/gruvbox'

cal vundle#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ================== PLUGINS CONFIGURATION ==================

" Theme config
let g:gruvbox_italic=1
set background=dark
colorscheme gruvbox

" True Colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Flagging unnecessary whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" YouCompleteMe config
let g:ycm_collect_identifiers_from_tags_files = 1   " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1               " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1          " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1                  " Completion in comments
let g:ycm_complete_in_strings = 1                   " Completion in string
let g:ycm_autoclose_preview_window_after_insertion = 1 " Closes preview window after user leaves insert mode

" Configuration for UltiSnips
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>"        "List possible snippets based on current file

" NERDTree config
map <C-n> :NERDTreeToggle<CR>

" ALE_flake8 config
let g:ale_python_flake8_options = "--max-line-length=120"


" ================== FILE TYPES CONFIGURATION ==================

" HTML
autocmd FileType html setlocal shiftwidth=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.html set filetype=htmldjango        " all html files are htmldjango files


" ================== VIM CONFIGURATION ==================

" Identation
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces

" Code folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" UI Config
set number	            " show line numbers
set relativenumber      " Show line number on the current line and relative numbers on the rest
set cursorline          " highlight current line
set showcmd             " show command in bottom bar
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.

" Status
set title               " Set the window's title, showing the current file name
set laststatus=2        " Always display the status bar
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c) " Don't ask for now...

" Mouse
set mouse=a             " mouse support for terminal

" Searching
set incsearch           " search as characters are entered
set history=200         " history of commands set to 200 lines

" Overrides tab-completion for all file-related tasks
set path+=**

" Text rendering options
set encoding=utf-8      " set encoding
set showmatch           " highlight matching [{()
set linebreak
syntax enable
