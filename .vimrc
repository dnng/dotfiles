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
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Language server
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" For linting and syntax checking
Plug 'dense-analysis/ale'

" NERDTree for file browsing
Plug 'preservim/nerdtree'

" For code navigation. It shows symbols such as classes, methods, and variables
" in a sidebar, allowing you to quickly navigate through your code.
Plug 'preservim/tagbar'

" FZF for fuzzy finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Vim-Virtualenv for virtual environment management
Plug 'jmcantrell/vim-virtualenv'

" Surrounding superpowers
Plug 'tpope/vim-surround'

" For Git integration
Plug 'tpope/vim-fugitive'

" Status bar superpowers
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Misc
Plug 'godlygeek/tabular'
Plug 'flazz/vim-colorschemes'

" Jinja files syntax highlighting
Plug 'lepture/vim-jinja'

" Stuff for Golang
Plug 'fatih/vim-go'

" Initialize plugin system
call plug#end()

" Send the autocomplete function to work with the LSP plugin
" User C-x-o to start the autocomplete
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gi <plug>(lsp-definition)
    nmap <buffer> gd <plug>(lsp-declaration)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gl <plug>(lsp-document-diagnostics)
    nmap <buffer> <f2> <plug>(lsp-rename)
    nmap <buffer> <f3> <plug>(lsp-hover)
endfunction

" Calls the function above when the LSP server is loaded
augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" ---------------------------------------------------------------------
" REMEMBER TO COMPILE YCM WITH --clang-completer AND --gocode-completer
"               PUT YOUR NON-PLUGIN STUFF AFTER THIS LINE
" ---------------------------------------------------------------------
set expandtab " Tabs into spaces
set ts=4      " Tab = 4 spaces
set tw=80     " Text Width 80 characters chars
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
set nocursorline
set autowrite " Auto save the file when calling 'make' from within Vim

syntax enable

map <Leader>t :NERDTreeToggle<cr>
colo molokai
let mapleader = "\\"

" Next buffer
nnoremap <Leader>b :bnext<CR>

" Previous buffer
nnoremap <Leader>B :bprev<CR>

" Shortcuts to make it easier to jump between errors in quickfix list
map <Leader>n :cnext<CR>
map <Leader>m :cprevious<CR>
nnoremap <Leader>a :cclose<CR>

" This defines the visible expression of whitespace characters
" Use "set list" to display this characters and "set nolist" to hide them
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set tags=./tags;/

" Visual mode my ass! Q repeats the last macro instead.
" Many thanks to: http://vimbits.com/bits/263
nnoremap Q @@

" Before writting the whole buffer to a file, clean trailing whitespace
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

" Configure ALE for javascript and python
let g:ale_linters = {}
let g:ale_fixers = {}

let g:ale_linters['python'] = ['flake8', 'mypy']
let g:ale_fixers['python'] = ['black', 'autoflake']

" Ignore Line too long (82 > 79 characters) (E501)
let g:ale_python_flake8_options = '--ignore=E501'

let g:ale_linters['javascript'] = ['eslint']
let g:ale_fixers['javascript'] = ['eslint']


" Airline configuration
let g:airline_theme='hybridline'
