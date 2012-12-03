"
" Stephen "Rixius" Middleton's
" .VimRC ViM configuration.
" (c) 2012 Stephen "Rixius" Middleton
" Licensed under an MIT-Style Free and Open Software License
"
" Core Features{{{1
call pathogen#infect()
set nocompatible            " Overides distro default and resets to sane standards
filetype indent plugin on   " Attempts to determine filetype
syntax on                   " Enable syntax highlighting
colorscheme desert

set hidden            " Allows swapping of buffers without saving
set wildmenu          " Better command-line completion
set smartcase         " Insensitive Searches
set backspace=indent,eol,start
                      " Allow backspacing over listed parts
set number            " Display the number Lines
set ruler             " Display Cursor position
set laststatus=2      " Always display the status line
set confirm           " If command requires saved file prompt to save file
set t_vb=             " Disables any errors
set cmdheight=2       " Avoid \"press <Enter> to continue"

set listchars=tab:▸\ ,trail:-,eol:¬
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab

set nobackup
set nowb
set noswapfile

" Core Maps {{{1

" Overide Leader
let mapleader = " "
let g:mapleader = " "

noremap <leader>s :set hlsearch!<cr>
noremap <leader>l :set list!<cr>

" Map C-Directions to changing space
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

noremap   <up>      <nop>
noremap   <left>    <nop>
noremap   <right>   <nop>
noremap   <down>    <nop>

inoremap   jk      <esc>
inoremap   <esc>   <nop>

" Tab Movements
"noremap <C-S-]> :gt<cr>
"noremap <C-S-[> :gT<cr>


" Swift vimrc development {{{1

augroup vimrc_development
  autocmd!
  autocmd BufWritePost .vimrc source $MYVIMRC
augroup END
nmap <leader>ev :vsp $MYVIMRC<cr>


" NERDTree/Comment{{{1
nmap <leader>p :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['tags', '\.git', '\\index$', '\\log$', 'tmp', '\\pkg', '\.swp$', '\.db$', '\.gz$', '\.DS_Store', '\~$']
nmap \\ <Plug>NERDCommenterInvert
xmap \\ <Plug>NERDCommenterInvert

" Filetype Detection TODO: Sort out! {{{1
let g:is_bash = 1           " Highlight all .sh as bash
let g:ruby_minlines = 500
augroup filetypedetection
  autocmd!
  autocmd BufNewFile,BufRead *.haml set ft=haml
  autocmd BufNewFile,BufRead *.jade set ft=jade
  autocmd BufRead * if ! did_filetype() && getline(1)." ".getline(2).
    \ " ".getline(3) =~? '<\%(!DOCTYPE \)\=html\>' | setf html | endif
  autocmd BufNewFile,BufRead Gemfile set ft=ruby
  autocmd BufNewFile,BufRead *.ru set ft=ruby
  autocmd FileType ruby setlocal comments=:#\ 


augroup END

" Vimscript file settings {{{1
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevelstart=0
augroup END

