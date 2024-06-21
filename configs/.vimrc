set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-commentary'
    Plugin 'editorconfig/editorconfig-vim'
    Plugin 'davidhalter/jedi-vim'
    Plugin 'tmhedberg/simpylfold'
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'godlygeek/tabular'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'preservim/nerdtree'
    Plugin 'bluz71/vim-nightfly-colors'
    Plugin 'nvie/vim-flake8'
    Plugin 'Vimjas/vim-python-pep8-indent'
    Plugin 'https://github.com/snakemake/snakemake.git', {'rtp': 'misc/vim/'}
    Plugin 'https://github.com/tpope/vim-surround.git'
    Plugin 'raivivek/vim-snakemake'

call vundle#end()

filetype plugin indent on
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set omnifunc=htmlcomplete#CompleteTags

" Set tabstop to 4 spaces
set tabstop=4

" Set the number of spaces used for each step of (auto)indentation to 4
set shiftwidth=4

" Use spaces instead of tabs
set expandtab

" Line numbering
:set number
:set relativenumber

" Default to opening a new pane on the right
:set splitright

" Search settings
set incsearch
set hlsearch

" Syntax highlighting
syntax on

set foldmethod=indent
set nofoldenable
set smartcase

" Make sure clipboard is shared with system clipboard
set clipboard+=unnamedplus

" Line wrapping
set wrap

" Allow backspace to delete newline and return to previous line
set backspace=indent,eol,start

" Use Ctrl + h, j, k, l for moving between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
onoremap b i[|
onoremap p i(|
onoremap c i{|
onoremap q i"|

" Abbreviates :vert term to :vt
cabbrev vt vert ter

" Dynamically set to current conda env python
let python_path = substitute(system('which python'), '\n', '', '')
let $PYTHONPATH = python_path

python3 << EOF
import sys
import subprocess

site_packages = subprocess.check_output(["python", "-c", "import site; print(site.getsitepackages()[0])"], universal_newlines=True).strip()
if site_packages not in sys.path:
   sys.path.insert(1, site_packages)
EOF

let mapleader = " "
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>nh :nohl<CR>
nnoremap <leader>tt :Tabularize /\t<CR>
nnoremap <leader>l :set cursorline<CR>
nnoremap <leader>ll :set nocursorline<CR>

let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = ""
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#rename_command_keep_name = "<leader>R"

let g:jedi#use_splits_not_buffers = "right"
let g:jedi#popup_on_dot = 0
let g:jedi#completions_enabled = 0

" Set the colorscheme for vim
colorscheme nightfly
