call plug#begin('~/AppData/Local/nvim/plugged')

" below are some vim plugin for demonstration purpose

Plug 'joshdick/onedark.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/forest-night'
Plug 'nightsense/seagrey'
Plug 'franbach/miramare'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf'
Plug 'scrooloose/nerdtree'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Valloric/YouCompleteMe'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'

call plug#end()

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

let mapleader=" "

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set nowrap
set formatoptions=tcqrn1
" set tabstop=2
" set shiftwidth=2
" set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

let g:ycm_min_num_of_chars_for_completion = 2

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" -----------------------------------
" -----------------------------------

" Colors

" -----------------------------------
" -----------------------------------

" Color scheme (terminal)
" set t_Co=256
" set background=dark
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" -----------------------------------
" Sonokai
" -----------------------------------

" let g:sonokai_style = 'default'
" let g:sonokai_enable_italic = 1
" let g:sonokai_disable_italic_comment = 1

" let g:airline_theme = 'sonokai'

" colorscheme sonokai


" -----------------------------------
" Gruvbox
" -----------------------------------

" set background=dark

" Set Contrast
" let g:gruvbox_material_background = 'hard'

" colorscheme gruvbox-material

"set background=dark
"let g:gruvbox_italic = '1'
"let g:gruvbox_transparent_bg = '1'

"colorscheme gruvbox

colorscheme dracula

" -----------------------------------
" Miramare
" -----------------------------------

" let g:airline_theme = 'miramare'

" let g:miramare_enable_italic = 1
" let g:miramare_disable_italic_comment = 1
" let g:miramare_enable_bold = 1

" colorscheme miramare

" -----------------------------------
" Seagrey
" -----------------------------------

" let g:seagrey_dark_CursorLineNr = 'off'
" let g:seagrey_light_CursorLineNr = 'off'

" let g:seagrey_dark_LineNr = 'off'
" let g:seagrey_light_LineNr = 'off'

" colorscheme seagrey-light

" -----------------------------------
" Forest Night
" -----------------------------------

" let g:airline_theme = 'forest_night'
" let g:forest_night_enable_italic = 1

" colorscheme forest-night

" -----------------------------------
"  One Dark
" -----------------------------------

" let g:onedark_hide_endofbuffer = 1
" let g:ondar_termcolors = 256
" let g:onedark_terminal_italics = 1

" let g:airline_theme = 'onedark'

" syntax on
" colorscheme onedark

" -----------------------------------
" Keybinds
" -----------------------------------

map <C-o> :NERDTreeToggle<CR>
map <C-i> :%!astyle<CR>
" nmap <C-i> :set expandtab tabstop=2 softtabstop=2<CR>
nmap <C-l> :noh<CR>

" NERDCommenter Keybinds
" select with visual (<leader>cc) - to comment
" select with visual (<leader>cu) - to uncomment

nnoremap <silent> <leader>o :FZF<CR>
