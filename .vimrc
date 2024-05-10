"Without it, whenever you switch buffers and your current buffer is not
" saved, Vim will prompt you to save the file ,you don't want that if you want
" to move quickly
set hidden

" Enable improved vim mode 
set nocompatible

" automatically fold 
:set foldmethod=indent

" Look and feel
" Turns on syntax highlighting
syntax enable

" Enables a completion menu when tab-completing file paths
set wildmenu


let g:loaded_youcompleteme = 1 " Disable YouCompleteMe by default

" Optimize screen redraw
set lazyredraw

" Sets miliseconds for cursor update delay
set updatetime=300

" Enables mouse support
set mouse=a

" Numbers

" Shows the column and line number of the cursor position
set ruler

" Shows the current Vim mode
set showmode

" Error Bells
" Disables error beeps
set noerrorbells visualbell t_vb=

" Always shows the status line
set laststatus=2


" Leader key is set to space
let mapleader=" "
set cursorline
set cursorcolumn

" Allow crosshair cursor highlighting.
hi CursorLine   cterm=NONE ctermbg=0
hi CursorColumn cterm=NONE ctermbg=0
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Toggle highlight search
nnoremap <Leader>h :set hlsearch!<CR>

" Indentation
set autoindent
set cindent
set smartindent
autocmd FileType javascript,typescript setlocal shiftwidth=2 tabstop=2

" Paste toggle
set pastetoggle=<F12>



" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
 silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs),'!isdirectory(v:val.dir)'))
 \| PlugInstall --sync | source $MYVIMRC
\| endif

" vim-plug plugins

call plug#begin()
Plug 'rafi/awesome-vim-colorschemes'
Plug 'danilo-augusto/vim-afterglow'

Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'    " Vim powerline


Plug 'airblade/vim-gitgutter'     " Show git diff of lines edited
Plug 'tpope/vim-fugitive'         " :Gblame
Plug 'tpope/vim-rhubarb'          " :GBrowse

Plug 'nathanaelkane/vim-indent-guides'

Plug 'wellle/context.vim'        " Contextual information
Plug 'editorconfig/editorconfig-vim' " EditorConfig support

Plug 'jiangmiao/auto-pairs' " Auto pairs

Plug 'tpope/vim-surround' " Surround text objects



Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }

Plug 'preservim/nerdcommenter'

Plug 'github/copilot.vim'

call plug#end()

" Fuzzy-find from buffer numbers using Tab completion:
nnoremap <silent> <Leader>b :buffers<CR>
nnoremap <silent> <Leader>n :bn<CR>
nnoremap <silent> <Leader>p :bp<CR>

" Re-enables filetype detection, along with plugin-specific behavior and smart
" indentation.
filetype plugin indent on


" Cursor config
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

" To search for files inside Vim using fzf.vim plugin, you can use the :Files method. Run :Files from Vim and you will be prompted with fzf search prompt.
nnoremap <silent> <C-f> :Files<CR>

" To search inside files, you can use the :Rg command
nnoremap <silent> <Leader>f :Rg<CR>

"Now let's setup grepprg so that the :grep Vim command uses ripgrep. Add this in your vimrc
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" backspace setting
set backspace=indent,eol,start


set relativenumber number

" colorscheme afterglow
colorscheme darkblue

"To make Vim to paste copied text from the external program with just p, you can add this in your vimrc: 
set clipboard=unnamed

"Make sure that you have filetype plugins enabled, as the plugin makes use of
"|commentstring| where possible (which is usually set in a filetype plugin).
"See |filetype-plugin-on| for details
filetype plugin on

