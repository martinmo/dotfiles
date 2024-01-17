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
Plugin 'sheerun/vim-polyglot'

" Color schemes
Plugin 'tomasr/molokai'

call vundle#end()

if has("gui_running") && has("mac")
  set guioptions=gm
  set guifont=Fira\ Code:h12
  set linespace=4
  set guicursor+=a:blinkon0

  " turn off annoying beep
  set visualbell
endif

colorscheme molokai
set bg=dark

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
set hidden
set hlsearch
set ignorecase
set incsearch
set nolinebreak
set modeline
set mouse=a
set number
set scrolloff=5
set showcmd
set showmatch
set smartcase
set wildmenu
set textwidth=0
set listchars=tab:▸\ ,eol:¬

" special settings for vim in diff mode
if &diff
  set noautoread
  set nonumber
endif

if has("clipboard")
  if has("mac")
    " on OS X, integrate with the clipboard
    set clipboard=unnamed
  elseif has("unix")
    " for vim-gtk3 on Ubuntu
    set clipboard=unnamedplus
  endif
endif

" use 4 spaces instead of tabstops by default
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" don't wrap lines by default
set nowrap

" but if we do, display wrapped lines with indent
set breakindent

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

" delete trailing whitespace during saving
au FileType
  \ css,html,htmldjango,javascript,jinja,less,python,ruby,sh,tex,text,vim,xml,yaml,zsh
  \ au BufWritePre <buffer> :%s/\s\+$//e

" auto-wrap lines in text-like files
au FileType
  \ markdown,tex,text,asciidoc
  \ setl textwidth=99 wrap linebreak

""
"" GENERAL PLUGIN SETTINGS
""
let mapleader=","


""
"" VIM-AIRLINE SETTINGS
""
" mode is already shown by vim-airline
set noshowmode
set fillchars+=stl:\ ,stlnc:\

let g:airline#extensions#tabline#enabled = 1
set showtabline=1

" enable powerline fonts
let g:airline_powerline_fonts = 1


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


""
"" ABBREVIATIONS
""
iabbrev misc miscellaneous
iabbrev unnec unnecessary
