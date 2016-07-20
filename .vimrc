" ----------------------------------------------------------------------------
" - File: ~/.vimrc
" - Author: Daniel Noguchi < danielnoguchi at gmail dot com '>
" - Created:      Apr 18, 2012
" - Installation: - As dotfile drop the file into your $HOME/ folder.
" -               - In Command line put $vim -U .vimrc.
" - License: GNU General Public License v3
" -          <http://www.gnu.org/licenses/gpl.html>
" ----------------------------------------------------------------------------

set nocompatible    " be iMproved
filetype off        " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Installing plugins via Vundle
" This assumes you already installed vundle via:
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
" let Vundle manage Vundle (required!)
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'Lokaltog/powerline'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree' 
Bundle 'godlygeek/tabular'
Bundle 'flazz/vim-colorschemes'
Bundle 'digitaltoad/vim-jade'
Bundle 'Valloric/YouCompleteMe'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle 'SirVer/ultisnips'
Bundle "honza/vim-snippets"
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'unicode.vim'
Bundle 'taglist.vim'
Bundle 'fatih/vim-go'

filetype plugin indent on     " required!

" Brief help
" BundleList          - list configured bundles
" BundleInstall(!)    - install(update) bundles
" BundleSearch(!) foo - search(or refresh cache first) for foo
" BundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set textwidth=80
set shiftwidth=4
set nonu

set expandtab " Tabs into spaces
set ts=4      " Tab = 4 spaces

set sw=4      " Number of collums shifted by the command '>' or '<'
set sm        " Highlight enclosing brackets
set wm=4      " No of characters from the right window border where wrapping starts
set incsearch " Show first mach for the pattern being written
set hlsearch  " Highlights all the matches for the searched pattern

" Set highlight for line and column
set cursorline
" set cursorcolumn

" This defines the visible expression of whitespace characters
" Use "set list" to display this charaters and "set nolist" to hide them
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set tags=./tags;/

colo distinguished

autocmd BufWritePre *.c :%s/\s\+$//e
autocmd BufWritePre *.h :%s/\s\+$//e

" Automatically open the quickfix window after you run make
autocmd QuickFixCmdPost * :copen

filetype on
filetype plugin indent on
autocmd BufWritePost *.c :TlistUpdate
autocmd FileType make setlocal noexpandtab " Turn off expandtab for Makefiles
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black 

filetype plugin indent on
syntax enable

let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_WinWidth = 50
let Tlist_Use_Right_Window = 1

" Mappings to ease my life :-)
map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
map <F4> :TlistToggle<cr>
map <F5> :NERDTreeToggle<cr>

" Change comments from C++ style to C style
map <F6> :s#\/\/\(.*\)#/*\1 */#<cr>

map <F8> :!/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Enter newline without entering insert mode
map <S-Enter> O<Esc>
map <CR> o<Esc>

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif


" Disable ycm file check
let g:ycm_confirm_extra_conf = 0

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"                                           
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

set rtp+=/Users/dnoguchi/.vim/bundle/powerline/powerline/bindings/vim/
set laststatus=2
set guifont=Inconsolata\ for\ Powerline:h13
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

" vim-go specifics
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 0

