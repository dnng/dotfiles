" ----------------------------------------------------------------------------
" File: ~/.vimrc
" Author: Daniel Noguchi < danielnoguchi at gmail dot com '>
" Created: Apr 18, 2012
" Installation: - As dotfile drop the file into your $HOME/ folder.
"               - In Command line put $vim -U .vimrc.
" License: MIT < https://opensource.org/licenses/MIT >
" ----------------------------------------------------------------------------

set nocompatible " be iMproved, required
filetype off     " required

" Set-up Vundle
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Lokaltog/powerline'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'flazz/vim-colorschemes'
Plugin 'digitaltoad/vim-jade'
Plugin 'fatih/vim-go'
Plugin 'leafgarland/typescript-vim'

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" ---------------------------------------------------------------------
" REMEMBER TO COMPILE YCM WITH --clang-completer AND --gocode-completer
"               PUT YOUR NON-PLUGIN STUFF AFTER THIS LINE
" ---------------------------------------------------------------------
set expandtab " Tabs into spaces
set ts=4      " Tab = 4 spaces
set tw=80
set sw=4      " Number of collums shifted by the command '>' or '<'
set sm        " Highlight enclosing brackets
set wm=4      " No of characters from the right window border where wrapping starts
set incsearch " Show first mach for the pattern being written
set hlsearch  " Highlights all the matches for the searched pattern
set nonu

" Set highlight for line and column
set cursorline

" Auto save the file when calling 'make' from within Vim
set autowrite

" Shortcuts to make it easier to jump between errors in quickfix list
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" This defines the visible expression of whitespace characters
" Use "set list" to display this charaters and "set nolist" to hide them
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set tags=./tags;/

" Visual mode my ass! Q repeats the last macro instead.
" Many thanks to: http://vimbits.com/bits/263
nnoremap Q @@

colo distinguished

autocmd BufWritePre *.c :%s/\s\+$//e
autocmd BufWritePre *.h :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e


" Automatically open the quickfix window after you run make
autocmd QuickFixCmdPost * :copen

autocmd BufWritePost *.c :TlistUpdate
autocmd FileType make setlocal noexpandtab " Turn off expandtab for Makefiles
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black 

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

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

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
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Go Specific Stuff

au BufRead,BufNewFile *.go set filetype=go
autocmd FileType go setlocal softtabstop=4
autocmd FileType go setlocal shiftwidth=4
autocmd FileType go setlocal tabstop=4
