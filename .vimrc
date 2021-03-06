﻿"
" Stephen "Rixius" Middleton's
" .VimRC ViM configuration.
" (c) 2012 Stephen "Rixius" Middleton
" Licensed under an MIT-Style Free and Open Software License
"
" Set up Vundle {{{1
set nocompatible            " Overides distro default and resets to sane standards
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Control Vundle with Vundle
Plugin 'Vundle/Vundle.vim'

"Tpope plugins
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'

"NERDPlugins
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'

Plugin 'markabe/bufexplorer'
Plugin 'godlygeek/tabular'

call vundle#end()

" Core Features{{{1
filetype indent plugin on   " Attempts to determine filetype
syntax enable               " Enable syntax highlighting
set background=dark
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
  autocmd BufWritePost .vimrc source $MYVIMRC
augroup END
nmap <leader>ev :vsp $HOME/src/dotfu/.vimrc<cr>

" Colorscheme Helpers {{{2
nnoremap <C-S-P> :call <SID>SynStack()<cr>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

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

" My Twig settings dissappeared >_> {{{1
augroup filetype_twig
    autocmd!
    autocmd FIleType twig ab <buffer> enb {% endblock %}
    autocmd FIleType twig ab <buffer> eni {% endif %}
    autocmd FIleType twig ab <buffer> enf {% endfor %}
    autocmd FileType twig ab <buffer> nb {% block _ %}
    autocmd FileType twig ab <buffer> ni {% if _ %}
    autocmd FileType twig ab <buffer> nf {% for _ in _ %}
augroup END

" Adding a string for debugging {{{1
fun! RandomDebug()

    let g:uuid = ""
    :python import uuid, vim; vim.command("let g:uuid = '" + str(uuid.uuid1()) + "'")

endfun

" Diff Current Buffer versus Written {{{1
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" SVN Diff Open {{{1

fun! SVNDiff()

    new
    r !svn diff
    set syntax=diff buftype=nofile

endfun
com! SVNDiff call SVNDiff()

" Plugin Configurations~ {{{1

:set tags=tags
let g:taggatron_enabled = 0
let g:tagcommands = {
\    "php" : {"tagfile":"php.tags","args":"-R --h *.php"},
\}

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


