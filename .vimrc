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

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Plugin 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

" Stuff for Javascript
Plug 'ternjs/tern_for_vim'
Plug 'vim-syntastic/syntastic'
Plug 'digitaltoad/vim-pug'

" Surrounding superpowers
Plug 'tpope/vim-surround'

" Status bar superpowers
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Misc
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'flazz/vim-colorschemes'

" Stuff for Golang
Plug 'fatih/vim-go'

" Initialize plugin system
call plug#end()

" ---------------------------------------------------------------------
" REMEMBER TO COMPILE YCM WITH --clang-completer AND --gocode-completer
"               PUT YOUR NON-PLUGIN STUFF AFTER THIS LINE
" ---------------------------------------------------------------------
set expandtab " Tabs into spaces
set ts=4      " Tab = 4 spaces
set tw=80     " Text Width 80 characters cha
set sw=4      " Number of collums shifted by the command '>' or '<'
set sm        " Highlight enclosing brackets
set wm=4      " No of characters from the right window border where wrapping starts
set incsearch " Show first mach for the pattern being written
set hlsearch  " Highlights all the matches for the searched pattern
set nonu
set backspace=indent,eol,start
set laststatus=2 " Windows always have a status bar
set guifont=Inconsolata\ for\ Powerline:h13
set encoding=utf-8
set termencoding=utf-8
set cursorline " Set highlight for line and column
set autowrite " Auto save the file when calling 'make' from within Vim
syntax enable
map <Leader>t :NERDTreeToggle<cr>
colo Molokai

" Shortcuts to make it easier to jump between errors in quickfix list
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" This defines the visible expression of whitespace characters
" Use "set list" to display this characters and "set nolist" to hide them
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set tags=./tags;/

" Visual mode my ass! Q repeats the last macro instead.
" Many thanks to: http://vimbits.com/bits/263
nnoremap Q @@

" Before writting the whgole buffer to a file, clean trailing whitespace
autocmd BufWritePre *.c :%s/\s\+$//e
autocmd BufWritePre *.h :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e

" Automatically open the quickfix window after you run make
autocmd QuickFixCmdPost * :copen

" Turn off expandtab for Makefiles
autocmd FileType make setlocal noexpandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2


" vimdiff color settings
highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black

" Enter newline without entering insert mode
map <S-Enter> O<Esc>
map <CR> o<Esc>

let g:ycm_confirm_extra_conf = 0 " Disable ycm file check
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

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
autocmd BufRead,BufNewFile *.go set filetype=go
autocmd FileType go setlocal softtabstop=4
autocmd FileType go setlocal shiftwidth=4
autocmd FileType go setlocal tabstop=4

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" Airline configuration
let g:airline_theme='powerlineish'
