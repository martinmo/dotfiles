set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle manages itself
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'sheerun/vim-polyglot'
Plugin 'ctrlpvim/ctrlp.vim'

" Color schemes
Plugin 'tomasr/molokai'

call vundle#end()

colorscheme molokai

if has("gui_running") && has("mac")
  set guioptions=gm
  set guifont=Input\ Mono:h11
  set linespace=4

  " turn off annoying beep
  set visualbell
endif

" fallback omnifunc for ft plugins which don't set their own
au Filetype *
  \ if &omnifunc == "" |
  \   setlocal omnifunc=syntaxcomplete#Complete |
  \ endif

" jump to last position in file
au BufReadPost *
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
set scrolloff=10
set showcmd
set showmatch
set showtabline=1
set smartcase
set wildmenu
set cursorline
set listchars=tab:▸\ ,eol:¬
set colorcolumn=99
set textwidth=99

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

" wrap lines by default and visually indent wrapped lines by 4 shifts
set wrap
if v:version > 704 || v:version == 704 && has("patch354")
  set breakindent
  set breakindentopt=shift:4
endif

" base formatoptions: auto-wrap text and comments
set formatoptions=tc

" allow formatting of comments with "gq"
set formatoptions+=q

" where it makes sense, remove a comment leader when joining lines
if v:version > 703 || v:version == 703 && has("patch550")
  set formatoptions+=j
endif

" don't fold by default
set foldlevel=999

""
"" FILETYPE SPECIFIC SETTINGS
""
au FileType
  \ css,html,htmldjango,javascript,jinja,less,markdown,ruby,tex,vim,xml,yaml
  \ setl ts=2 sts=2 sw=2 et
au FileType python
  \ setl nowrap
au FileType go
  \ setl ts=4 noet

" delete trailing whitespace during saving
au FileType
  \ css,html,htmldjango,javascript,jinja,less,markdown,python,ruby,sh,tex,text,vim,xml,yaml,zsh
  \ au BufWritePre <buffer> :%s/\s\+$//e


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

if exists("*exepath")
  let s:py3 = exepath("python3")
else
  let s:py3 = "/usr/bin/python3"
endif
let g:ycm_python_binary_path = s:py3
let g:syntastic_python_python_exec = s:py3


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
set wildignore+=*/venvs/*,*/vendor/*,*/node_modules/*,*/htmlcov/*,*.pyc,*.pyo,*.swp,.DS_Store


""
"" VIM-AIRLINE SETTINGS
""
" mode is already shown by vim-airline
set noshowmode
set fillchars+=stl:\ ,stlnc:\

set showtabline=2
let g:airline#extensions#tabline#enabled = 1

" enable powerline fonts
let g:airline_powerline_fonts = 1


""
"" SIMPYLFOLD SETTINGS
""
let g:SimpylFold_fold_docstring = 0


""
"" SYNTASTIC SETTINGS
""
" recommended settings from the readme:
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ignore docstring warnings
let g:syntastic_python_flake8_post_args='--ignore=D'

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

" easy peasy movement in split windows
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" toggle hlsearch (adapted from the shadowed vim-sensible Ctrl-L mapping)
nnoremap <leader>l :set hlsearch!<cr>

" use space to fold/unfold
nnoremap <space> za

" quick escape
inoremap jj <esc>

" jump to definition or declaration
nnoremap <leader>g :YcmCompleter GoTo<cr>


""
"" ABBREVIATIONS
""
iabbrev misc miscellaneous
iabbrev unnec unnecessary
