syntax on

"General Settings
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set guifont=Ubuntu
set linespace=7
set belloff=all
set mouse=v 
set colorcolumn=80

"File Type settings
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType nginx setlocal commentstring=#

"Small Cursor in Insert Mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"Short Cut Settings
let mapleader = " "

nmap <Leader> <Space>
nmap <Leader>q @
nmap <Leader>hh :tabp
nmap <Leader>ll :tabn

inoremap <C-C> <ESC>

"Change Caps Lock to Ctr
"au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

"Plugins
call plug#begin('~/.vim/plugged')

"Git Functionality
Plug 'tpope/vim-fugitive'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"Python Auto Completion
"Plug 'davidhalter/jedi-vim'
" Vim Syntax Checker
Plug 'https://github.com/vim-syntastic/syntastic.git'
"Theme
Plug 'morhetz/gruvbox'
"File Type Supporchr4/nginx.vimt
Plug 'https://github.com/pedrohdz/vim-yaml-folds'
"nginx
Plug 'chr4/nginx.vim'
"Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Tex
Plug 'lervag/vimtex'
"Comments
Plug 'https://tpope.io/vim/commentary.git'
"Sorrounding
Plug 'tpope/vim-surround'
"Docker File Support
Plug 'ekalinin/Dockerfile.vim'
"Kubernetes Language Server (Yaml Support)
Plug 'neoclide/coc.nvim', {'branch': 'release'}


call plug#end()

"""Theme"""
"General
highlight Colorcolumn ctermbg=0 guibg=lightgrey
set background=dark
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

"Gruvbox
colo gruvbox
autocmd vimenter * ++nested colorscheme gruvbox
let g:gruvbox_contrast_dark='medium'


"""Syntastic Settings"""
"Status Line Configurations
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"General Syntastic Settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

"Syntastic Message Linters
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_tex_checkers = ['chktex, lacheck']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_sh_checkers = ['bashate', 'sh']
let g:syntastic_yaml_checkers = ['yamllint']

"Disable all style Messages
let g:syntastic_quiet_messages = {"type" : "style"}

"""Prettier"""
let g:prettier#autoformat = 0

"""UltiSnips Settings"""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
let g:UltiSnipsEditSplit="vertical"
