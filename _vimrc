" _vimrc - A vim confirguration file for Windows
"
" This is a  configuration file to be used on an installation of vim under
" Microsoft Windows. I keep this separate from my .vimrc for GNU/Linux  because
" I like to experiment with this one, and I don't think I'll use it as much as I
" use the one for GNU/Linux.

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set directory=.,$TEMP

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"set number " Show line numbers
set textwidth=80
set shiftwidth=4
set fo+=t " Reformats text when writing in the middle of a paragraph
set cc=80
set expandtab " Tabs into spaces
set ts=4      " Tab = 4 spaces
set sw=4      " Number of collums shifted by the command '>' or '<'
set sm        " Highlight enclosing brackets
set wm=4  
set incsearch " Show first mach for the pattern being written
set hlsearch " Highlights all the matches for the searched pattern

" This defines the visible expression of whitespace characters
" Use "set list" to display this charaters and "set nolist" to hide them
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set tags=./tags;/

" Set default colorscheme to desert
colorscheme desert

autocmd BufWritePre *.c :%s/\s\+$//e
autocmd BufWritePre *.h :%s/\s\+$//e

filetype on
filetype plugin indent on
autocmd FileType make setlocal noexpandtab " Turn off expandtab for Makefiles

highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black

filetype plugin indent on
syntax enable

set guifont=Consolas:h10 
set guifontwide=MingLiU:h10 "For windows to display mixed character sets
set encoding=utf-8 

" Enter newline without entering insert mode
map <S-Enter> O<Esc>
map <CR> <Esc>
