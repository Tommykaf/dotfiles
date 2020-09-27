set nocompatible

" Turn on syntax highlighting and load plugins
syntax on
filetype plugin indent on

" Read vim settings only from first line of file
set modelines=1

set fileencoding=utf-8
set encoding=utf-8

"""""""""""
" Plugins "
"""""""""""
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP client
Plug 'preservim/nerdcommenter' " Comment123
Plug 'preservim/nerdtree' " Sidebar
Plug 'tpope/vim-fugitive' " git plugin
Plug 'jistr/vim-nerdtree-tabs' " NERDTree + tabs
Plug 'mhinz/vim-startify' " Start window swag
Plug 'ryanoasis/vim-devicons' " NERDTree file icons
Plug 'editorconfig/editorconfig-vim' " Editorconfig support
Plug 'sheerun/vim-polyglot' "Manylangs

" Airline
Plug 'vim-airline/vim-airline' " Bar
Plug 'vim-airline/vim-airline-themes' " Bar themes

" Languages
Plug 'plasticboy/vim-markdown' " MD
Plug 'latex-box-team/latex-box' " Latex
Plug 'JuliaEditorSupport/julia-vim' " julia
Plug 'vim-python/python-syntax' " Python

" Themes
Plug 'marciomazza/vim-brogrammer-theme' " Brogrammer theme
Plug 'dracula/vim' " Dracula theme
Plug 'hzchirs/vim-material' " Material theme

call plug#end()

"""""""""""
" Mapping "
"""""""""""

let mapleader=","

" ctrl-b to tree
map <C-b> :NERDTreeToggle %:p:h<CR>

" Hebrew
" map ??? :set invhk inrl<CR>

""""""""""""""""""
" Editor options "
""""""""""""""""""

" Line numbers
set relativenumber
set number

" Text wrapping
set wrap
set linebreak

" Backspace can work in all modes under certain restrictions
set backspace=indent,eol,start

" Timeouts
set timeout
set ttimeout
set timeoutlen=1000
set ttimeoutlen=50

" Wildstuff
set wildmenu
set wildmode=longest:full,full

" cmd
set showcmd
set cmdheight=1

" CoC
set updatetime=300
set shortmess+=c
set nobackup
set nowritebackup
let g:coc_global_extensions = [
\ 'coc-python',
\ 'coc-json',
\ 'coc-tsserver',
\ 'coc-html',
\ 'coc-css',
\ 'coc-java',
\ 'coc-pairs',
\ 'coc-ultisnips'
\ ]
" Search
set incsearch
set hlsearch
set smartcase
set ignorecase
set inccommand=nosplit

" Misc
set showmatch
set scrolloff=6
set autoread
set lazyredraw
set laststatus=2
set ruler
set signcolumn=yes
set noswapfile
set hidden
set gdefault
set pyxversion=3

" Folding
set foldmethod=indent
set foldcolumn=1
set foldlevelstart=99

" Tabs to spaces
set expandtab
set autoindent
set smartindent
set shiftround

" 4 spaces as god indented
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Colors
set termguicolors
let base16colorspace=256
let g:material_style='oceanic'
set background=dark
colorscheme vim-material

" Airline
let g:airline_theme='material'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" NERDCommenter
let g:NERDSpaceDelims=1
let g:NERDCompactSpaceComs=1
let g:NERDDefaultAlign='left'
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1
let g:NERDToggleCheckAllLines=1

" No arrows for you
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

"""""""""""""""""""""""""
" CoC vscode formatting "
"""""""""""""""""""""""""

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.  <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.

if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

""""""""""""""""""
" GoTos and docs "
""""""""""""""""""

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""
" CoC diagnostic travel across space and time "
"""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

""""""""""""""
" Formatting "
""""""""""""""

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


""""""""""""""""
" CoC commands "
""""""""""""""""

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

""""""""""""""""""""""""""
" CoC Statusline support "
""""""""""""""""""""""""""

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
