"
" Stephen "Rixius" Middleton's
" NeoVim Configuration
" (c) 2017 Stephen "Rixius" Middleton
" Licensed under an MIT-Style Free and Open Software License
"

" Minpac plugin manager{{{1
if exists("*minpac#init")
    call minpac#init()

    "call minpac#add('k-takata/minpac', {'type': 'opt'})

    call minpac#add('lifepillar/vim-solarized8')
    call minpac#add('tpope/vim-surround')
    call minpac#add('tpope/vim-fugitive')
    call minpac#add('tpope/vim-repeat')
    call minpac#add('tpope/vim-unimpaired')
    call minpac#add('SirVer/ultisnips')
    call minpac#add('tommcdo/vim-exchange')
    call minpac#add('scrooloose/nerdtree')
    call minpac#add('scrooloose/nerdcommenter')
    call minpac#add('markabe/bufexplorer')
    call minpac#add('godlygeek/tabular')
endif

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate packadd minpac | source ~/.config/nvim/init.vim | call minpac#update()
command! PackClean  packadd minpac | source ~/.config/nvim/init.vim | call minpac#clean()

" Core Features{{{1
filetype indent plugin on   " Attempts to determine filetype
syntax enable               " Enable syntax highlighting
set background=dark
colorscheme solarized8_dark

" Toggles light and dark solarized
nnoremap  <leader>B :<c-u>exe "colors" (g:colors_name =~# "dark"
    \ ? substitute(g:colors_name, 'dark', 'light', '')
    \ : substitute(g:colors_name, 'light', 'dark', '')
    \ )<cr>

" Tunes the contrast of the solarized scheme
fun! Solarized8Contrast(delta)
  let l:schemes = map(["_low", "_flat", "", "_high"], '"solarized8_".(&background).v:val')
  exe "colors" l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 4 + 4) % 4]
endf

nmap <leader>- :<c-u>call Solarized8Contrast(-v:count1)<cr>
nmap <leader>+ :<c-u>call Solarized8Contrast(+v:count1)<cr>

set hidden            " Allows swapping of buffers without saving
set wildmenu          " Better command-line completion
set smartcase         " Insensitive Searches
set number            " Display the number Lines
set ruler             " Display Cursor position
set laststatus=2      " Always display the status line
set confirm           " If command requires saved file prompt to save file
set t_vb=             " Disables any errors
set cmdheight=2       " Avoid \"press <Enter> to continue"

set listchars=tab:>\ ,trail:-,eol:=
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set grepprg=ack

set nobackup
set nowb
set noswapfile

" Core Maps {{{1

" Overide Leader
let mapleader = " "
let g:mapleader = " "

noremap <leader>s :setlocal hlsearch!<cr>
noremap <leader>l :setlocal list!<cr>
nnoremap <leader>z <C-^>

" Fast Saving
nnoremap <leader>w :w<cr>

" Map C-Directions to changing space
nnoremap <leader>= <C-w>=
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

noremap   <up>      <nop>
noremap   <left>    <nop>
noremap   <right>   <nop>
noremap   <down>    <nop>

" Tab Movements
"noremap <C-S-]> :gt<cr>
"noremap <C-S-[> :gT<cr>

" Open up :%
nnoremap % :%

" Open up Manpage for word
nnoremap <s-[> K
vnoremap <s-[> K

" Working to better my navigation. {{{1
" Based on HardMode, GPLv2 code. See https://github.com/wikitopian/hardmode

nnoremap J Lj''j
nnoremap K Hk''k

let g:trainingMsg = "Don't give up~! Stick it out <3"
let g:currentMode = "EasyMode"
nnoremap <leader>x :call ToggleMode()<cr>

fun! HardMode() "{{{2
    set backspace=0

    nnoremap <left>        <esc>:echo g:trainingMsg<cr>
    nnoremap <right>       <esc>:echo g:trainingMsg<cr>
    nnoremap <up>          <esc>:echo g:trainingMsg<cr>
    nnoremap <down>        <esc>:echo g:trainingMsg<cr>
    nnoremap <pageup>      <esc>:echo g:trainingMsg<cr>
    nnoremap <pagedown>    <esc>:echo g:trainingMsg<cr>

    inoremap <left>        <esc>:echo g:trainingMsg<cr>
    inoremap <right>       <esc>:echo g:trainingMsg<cr>
    inoremap <up>          <esc>:echo g:trainingMsg<cr>
    inoremap <down>        <esc>:echo g:trainingMsg<cr>
    inoremap <pageup>      <esc>:echo g:trainingMsg<cr>
    inoremap <pagedown>    <esc>:echo g:trainingMsg<cr>

    vnoremap <left>        <esc>:echo g:trainingMsg<cr>
    vnoremap <right>       <esc>:echo g:trainingMsg<cr>
    vnoremap <up>          <esc>:echo g:trainingMsg<cr>
    vnoremap <down>        <esc>:echo g:trainingMsg<cr>
    vnoremap <pageup>      <esc>:echo g:trainingMsg<cr>
    vnoremap <pagedown>    <esc>:echo g:trainingMsg<cr>

    nnoremap h <esc>:echo g:trainingMsg<cr>
    nnoremap j <esc>:echo g:trainingMsg<cr>
    nnoremap k <esc>:echo g:trainingMsg<cr>
    nnoremap l <esc>:echo g:trainingMsg<cr>

    vnoremap h <esc>:echo g:trainingMsg<cr>
    vnoremap j <esc>:echo g:trainingMsg<cr>
    vnoremap k <esc>:echo g:trainingMsg<cr>
    vnoremap l <esc>:echo g:trainingMsg<cr>

endfun
fun! EasyMode() "{{{2
    set backspace=indent,eol,start

    nunmap <left>
    nunmap <right>
    nunmap <up>
    nunmap <down>
    nunmap <pageup>
    nunmap <pagedown>

    iunmap <left>
    iunmap <right>
    iunmap <up>
    iunmap <down>
    iunmap <pageup>
    iunmap <pagedown>

    vunmap <left>
    vunmap <right>
    vunmap <up>
    vunmap <down>
    vunmap <pageup>
    vunmap <pagedown>

    nunmap h
    nunmap j
    nunmap k
    nunmap l

    vunmap h
    vunmap j
    vunmap k
    vunmap l

endfun
fun! ToggleMode() "{{{2
    if g:currentMode == "HardMode"
        :echo "Leaving HardMode, come back soon. Please."
        :call EasyMode()
        let g:currentMode = "EasyMode"
    elseif g:currentMode == "EasyMode"
        :echo "Entering HardMode, Prepare to learn Vim. The Hardway."
        :call HardMode()
        let g:currentMode = "HardMode"
    else
        let g:currentMode = "HardMode"
        :call ToggleMode()
    endif
endfun


" Swift vimrc development {{{1

augroup vimrc_development
  autocmd!
  autocmd BufWritePost init.vim source $MYVIMRC
augroup END
nmap <leader>ev :vsp $HOME/src/.config/nvim/init.vim<cr>

" Vimscript file settings {{{1
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevelstart=0
augroup END

" PHP settings {{{1
augroup filetype_php
    autocmd!
    autocmd FileType php setlocal tabstop=4
    autocmd FileType php setlocal softtabstop=4
    autocmd FileType php setlocal shiftwidth=4
    autocmd FileType php setlocal expandtab
augroup END

" Ruby settings {{{1
augroup filetype_ruby
    autocmd!
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal expandtab
    autocmd FileType eruby setlocal tabstop=2
    autocmd FileType eruby setlocal softtabstop=2
    autocmd FileType eruby setlocal shiftwidth=2
    autocmd FileType eruby setlocal expandtab
    autocmd FileType yaml setlocal tabstop=2
    autocmd FileType yaml setlocal softtabstop=2
    autocmd FileType yaml setlocal shiftwidth=2
    autocmd FileType yaml setlocal expandtab
augroup END

" Javascript settings {{{1
augroup filetype_javascript
    autocmd!
    autocmd FileType javascript setlocal tabstop=2
    autocmd FileType javascript setlocal softtabstop=2
    autocmd FileType javascript setlocal shiftwidth=2
    autocmd FileType javascript setlocal expandtab
augroup END


" Plugin Configurations~ {{{1

" NERDTree/Comment{{{2
nmap <leader>p :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=[
\    'tags', 
\    '\.git$', 
\    '\\index$', 
\    '\\log$', 
\    'tmp', 
\    '\\pkg', 
\    '\.swp$', 
\    '\.db$', 
\    '\.gz$', 
\    '\.DS_Store', 
\    '\~$', 
\    '\.svn']
nmap \\ <Plug>NERDCommenterInvert
xmap \\ <Plug>NERDCommenterInvert
" nerdtree mappings settings {{{3
augroup filetype_nerdtree
    autocmd!
    autocmd FileType nerdtree map _ PX
augroup END

" BufExplorer{{{2
let g:bufExplorerShowDirectories=0
let g:bufExplorerShowRelativePath=1


" Autosave sessions {{{1
au FocusLost * silent! wa
