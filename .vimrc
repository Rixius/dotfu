"--------------\
" Core Features >
"--------------/
set nocompatible            " Overides distro default and resets to sane standards
filetype indent plugin on   " Attempts to determine filetype
syntax on                   " Enable syntax highlighting

"-----------------\
" Core Set Options >
"-----------------/
set hidden            " Allows swapping of buffers without saving
set wildmenu          " Better command-line completion
set nomodeline        " History of being highly insecure
set ignorecase
set smartcase         " Insensitive Searches
set autoindent        " Autoindent
set backspace=indent,eol,start
                      " Allow backspacing over listed parts
"set nostartofline     " Prevent certain actions from returning to the start
set number            " Display the number Lines
set ruler             " Display Cursor position
set laststatus=2      " Always display the status line
set confirm           " If command requires saved file prompt to save file
set visualbell
set t_vb=             " Disables any errors
set cmdheight=2       " Avoid \"press <Enter> to continue"
set ttimeoutlen=125   " Timeout keycommands swiftly
set pastetoggle=<F11> " Toggle Pastemode with Key

"------------\
" Indentation \
" Visual char /
"------------/
set listchars=tab:>\ ,trail:-
set tabstop=2
set smarttab
set expandtab
set shiftwidth=4
"----------\
" No Backup >
"----------/
set nobackup
set nowb
set noswapfile

"----------\
" Core Maps >
"----------/
" Overide Leader
let mapleader = ","
let g:mapleader = ","
" Map alternate Buffer to easier command
map <C-A> <C-^>
" Map C-Directions to changing space
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" reload vimrc swiftly
map <leader>r :source ~/.vimrc<cr>


"-----------------\
" Pathogen Plugins >
"-----------------/
runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))
endif

"-------------------\
" NERDTree / Comment >
"-------------------/
nmap <leader>p :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['tags', '\.git', '\\index$', '\\log$', 'tmp', '\\pkg', '\.swp$', '\.db$', '\.gz$', '\.DS_Store', '\~$']
nmap \\ <Plug>NERDCommenterInvert
xmap \\ <Plug>NERDCommenterInvert

"--------------------\
" Syntax Highlighting >
"--------------------/
let g:is_bash = 1           " Highlight all .sh as bash
let g:ruby_minlines = 500
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

augroup filetypedetection
  autocmd!
  autocmd BufNewFile,BufRead *.haml set ft=haml
  autocmd BufNewFile,BufRead *.jade set ft=jade
  autocmd BufRead * if ! did_filetype() && getline(1)." ".getline(2).
    \ " ".getline(3) =~? '<\%(!DOCTYPE \)\=html\>' | setf html | endif
  autocmd FileType java setlocal et sw=2 sts=2
  autocmd FileType javascript,coffee setlocal et sw=2 sts=2 isk+=$
  autocmd BufNewFile,BufRead Gemfile set ft=ruby
  autocmd BufNewFile,BufRead *.ru set ft=ruby
  autocmd FileType eruby,yaml,ruby setlocal et sw=2 sts=2
  autocmd FileType gitcommit setlocal spell
  autocmd FileType ruby setlocal comments=:#\  tw=79
  autocmd FileType sql setlocal et sw=2 sts=2
  autocmd FileType vim setlocal et sw=2 sts=2 keywordprg=:help

  " Scala
  autocmd BufNewFile,BufRead *.scala set filetype=scala
  autocmd FileType scala setlocal et sw=2 sts=2

  autocmd Syntax css syn sync minlines=50
augroup END
