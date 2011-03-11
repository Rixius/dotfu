runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))
endif

syntax on
filetype plugin indent on

set nocompatible
set nobackup
set noswapfile
set autoindent
set autoread
set backspace=indent,eol,start
set complete-=i " Searching includes can be slow
set display=lastline " When lines are cropped at the screen bottom, show as much as possible
if &grepprg ==# 'grep -n $* /dev/null'
  set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='*~'\ --exclude='*.log'\ --exclude=tags\ $*\ /dev/null
endif
set incsearch
set ignorecase
set laststatus=2 " Always show status line
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set list " Show trailing whitespace and tabs
set modelines=5
set scrolloff=1
set sidescrolloff=5
set showcmd
set showmatch
set smarttab
set expandtab
set tabstop=2
set shiftwidth=4

set ttimeoutlen=50 " Make ESC work faster
set wildmenu

if $TERM == '^\%(screen\|xterm-color\)$' && t_Co == 8
  set t_Co=16
endif

let mapleader = ","
let g:mapleader = ","

set ruler " Always show current position
set hid " Change buffer - without saving

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn backup off (since you're committing often, right?)
set nobackup
set nowb
set noswapfile

" map Ctrl-direction to changing space
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" map Ctrl+j/k to delete the line above/below and Alt-j/k to add a line
" above/below
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" map Comand+Space to return for faster command entering and file navigation
map <D-Space> <CR>

nmap <leader>w :w<cr> " Fast saving

let g:is_bash = 1 " Highlight all .sh files as if they were bash
let g:ruby_minlines = 500
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

let g:VCSCommandDisableMappings = 1

let g:surround_{char2nr('s')} = " \r"
let g:surround_{char2nr(':')} = ":\r"
let g:surround_indent = 1

runtime! plugin/matchit.vim
runtime! macros/matchit.vim

noremap <F1> <Esc>
noremap! <F1> <Esc>

" Folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=1

let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDShutUp = 1

" NERD Tree
nmap <silent> <Leader>p :NERDTreeToggle<CR>
let g:NERDChristmasTree=1
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['tags', '\.git', '\\index$', '\\log$', 'tmp', '\\pkg', '\.swp$', '\.db$', '\.gz$', '\.DS_Store', '\~$']

" NERD Commenter
nmap \\ <Plug>NERDCommenterInvert
xmap \\ <Plug>NERDCommenterInvert

" Taglist
nnoremap <silent> <Leader>f :TlistToggle<CR>
let g:Tlist_Use_Right_Window=1
let g:Tlist_GainFocus_On_ToggleOpen=1
let g:Tlist_Compact_Format=1
let g:Tlist_Enable_Fold_Column=0
let g:Tlist_Show_One_File=1
let g:Tlist_Close_On_Select=1
let g:Tlist_Sort_Type="name"

" Enable TAB indent and SHIFT-TAB unindent
vnoremap <silent> <TAB> >gv
vnoremap <silent> <S-TAB> <gv

function! RunSpec(Line)
  let file = expand('%')

  if a:Line != ''
    let line = ':'.a:Line
  else
    let line = ''
  endif

  if file =~ '_spec\.rb$'
    let command = 'bundle exec rspec'
  else
    return 1
  endif

  exe '!'.command.' '.file.line
endfunction

:map <Leader>r :call RunSpec(line('.'))<C-m>
:map <Leader>R :call RunSpec('')<C-m>

" VimClojure
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1

if has('gui_running')
  let moria_style = 'dark'
  colorscheme moria
else
  colorscheme desert256
endif

augroup vimrc
  autocmd!
  autocmd GuiEnter * set guifont=Monaco:h12 guioptions-=T guioptions-=L guioptions-=r fuoptions=maxvert,maxhorz
augroup END

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

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
