call pathogen#infect()
call pathogen#helptags()

set bg=dark
colorscheme smyck

if has("gui_running") && has("mac")
  set guioptions=gm
  set guifont=Hack:h12
  set linespace=1
  set t_Co=256

  " turn off annoying beep
  set visualbell
endif

" fallback omnifunc for ft plugins which don't set their own
autocmd Filetype *
  \ if &omnifunc == "" |
  \   setlocal omnifunc=syntaxcomplete#Complete |
  \ endif

" jump to last position in file
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif


""
"" BASE SETTINGS
""
set autoread
set complete+=i
set gdefault
set hidden
set hlsearch
set ignorecase
set incsearch
set linebreak
set modeline
set mouse=a
set number
set scrolloff=5
set showcmd
set showmatch
set showtabline=1
set smartcase
set wildmenu
set wrap
set cursorline
set listchars=tab:▸\ ,eol:¬

" special settings for vim in diff mode
if &diff
  set noautoread
  set nonumber
endif

" on OS X, integrate with the clipboard
if has("mac")
  set clipboard=unnamed
endif

" use 4 spaces instead of tabstops by default
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" disable comment continuation
set formatoptions=tcq


""
"" FILETYPE SPECIFIC SETTINGS
""
au FileType html,css,xml,tex,ruby,yaml,vim setl ts=2 sts=2 sw=2 et
au FileType python setl colorcolumn=99 nowrap
au FileType go setl ts=4 noet

" delete trailing whitespace during saving
au FileType text,python,ruby,vim,zsh,sh,html autocmd BufWritePre <buffer> :%s/\s\+$//e


""
"" GENERAL PLUGIN SETTINGS
""
let mapleader=","

""
"" YCM SETTINGS
""
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_goto_buffer_command = 'new-tab'

""
"" PYTHON SETTINGS
""
let g:python_highlight_all = 1
let g:ycm_python_binary_path = '/usr/local/bin/python3'


""
"" ULTISNIPS SETTINGS
""
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


""
"" CTRLP SETTINGS
""
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
set wildignore+=*/venvs/*,*/vendor/*,*/node_modules/*,*/htmlcov/**,*.pyc,*.pyo,*.swp


""
"" VIM-AIRLINE SETTINGS
""
" mode is already shown by vim-airline
set noshowmode
set fillchars+=stl:\ ,stlnc:\

set showtabline=2
let g:airline#extensions#tabline#enabled = 1

" enable powerline fonts (Hack includes them)
let g:airline_powerline_fonts = 1

" customize symbols for the Hack font
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.linenr = '№'


""
"" CUSTOM KEYBOARD MAPPINGS
""
" use tab to jump to matching brackets
nnoremap <tab> %
vnoremap <tab> %

" helpers for movement in wrapped lines
nnoremap k gk
nnoremap j gj
nnoremap ^ g^
nnoremap 0 g0
nnoremap $ g$

" quick escape
inoremap jj <esc>

" jump to definition or declaration
nnoremap <leader>g :YcmCompleter GoTo<cr>


""
"" ABBREVIATIONS
""
iabbrev misc miscellaneous
iabbrev unnec unnecessary
