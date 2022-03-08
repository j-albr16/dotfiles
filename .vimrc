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
set incsearch
set guifont=Ubuntu
set linespace=7
set belloff=all
set mouse=v 
set colorcolumn=80
    
"Correct Comment Highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

filetype plugin indent on
"File Type settings
autocmd FileType cabal setlocal commentstring=--\ %s
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType nginx setlocal commentstring=#
" yaml for docker-compose files
autocmd BufRead,BufNewFile docker-compose set ft=yaml

"Small Cursor in Insert Mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"Short Cut Settings
let mapleader = " "

nmap <Leader> <Space>
nmap <Leader>q @
nmap <Leader>hh :tabp<Cr>
nmap <Leader>ll :tabn<Cr>

inoremap <C-C> <ESC>

"Change Caps Lock to Ctr
"au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

"Plugins
call plug#begin('~/.vim/plugged')

"Git Functionality
Plug 'tpope/vim-fugitive'
"Theme
Plug 'morhetz/gruvbox'
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
" Vim File Collaboration
Plug 'FredKSchott/CoVim'
"Haskell Colorscheme
" Plug 'https://github.com/neovimhaskell/haskell-vim.git'
Plug 'romainl/Apprentice'


call plug#end()

"""Theme"""
"General
highlight Colorcolumn ctermbg=0 guibg=lightgrey
set background=dark
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

"Gruvbox
colo gruvbox
"autocmd vimenter * ++nested colorscheme gruvbox
" let g:gruvbox_contrast_dark='medium'
highlight link VarId Identifier
highlight link ConId Type

"""UltiSnips Settings"""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
let g:UltiSnipsEditSplit="vertical"
"""CoC Configurations"""

let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = ['coc-json', 'coc-docker', 'coc-sh', 'coc-git', 'coc-yaml', 'coc-snippets', 'coc-python', 'coc-texlab']
inoremap <silent><expr> <c-@> coc#refresh()

"""Haskell Colorscheme
" let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
" let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
" let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
" let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
" let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
" let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
" let g:haskell_backpack = 1                " to enable highlighting of backpack keywordslet
" let g:haskell_classic_highlighting = 0
" let g:haskell_disable_TH = 0
