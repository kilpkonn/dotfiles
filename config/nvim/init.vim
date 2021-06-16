
"----------------------------- Plugins (VimPlug)---------------------------"


call plug#begin('~/.config/nvim/plugged')

"Tools
    "Plug 'vifm/vifm.vim'
    Plug 'preservim/nerdtree'
    Plug 'airblade/vim-gitgutter'
    Plug 'neoclide/coc.nvim' , { 'branch' : 'release' } " Code completion

    
    Plug 'edwinb/idris2-vim', { 'for': 'idr' }          " Idris2 support
    Plug 'rust-lang/rust.vim', { 'for': 'rs' }          " Rust support
    Plug 'pangloss/vim-javascript', { 'for': 'js' }     " JavaScript support

    Plug 'idbrii/vim-gtm'

"Visual
    Plug 'tpope/vim-markdown'
    Plug 'ap/vim-css-color' "Displays a preview of colors with CSS
    Plug 'leafgarland/typescript-vim', { 'for': 'ts' }  " TypeScript syntax
    Plug 'maxmellon/vim-jsx-pretty', { 'for': 'jsx' }   " JS and JSX syntax
    Plug 'vim-airline/vim-airline'

"Color Schemes
    Plug 'morhetz/gruvbox'
    Plug 'sonph/onehalf', { 'rtp': 'vim' }

call plug#end()


"---------------------------- General Settings ----------------------------"
set encoding=UTF-8
set hidden
filetype plugin indent on  "Enabling Plugin & Indent
syntax on  "Turning Syntax on
set number relativenumber
set nu rnu
set autoread wildmode=longest,list,full
set spell spelllang=en_us
set backspace=indent,eol,start confirm
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab  
set laststatus=2 cmdheight=1
set splitbelow splitright 
set noswapfile nobackup nowritebackup
set colorcolumn=80
set cursorline
set hls is ic
set scrolloff=8
set nowrap

"Color Settings
"set t_Co=256
colorscheme gruvbox
"set background=dark cursorline

"set signcolumn=number

let g:coc_global_extensions = [ 'coc-tsserver' ]


autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"------------------------------ Key Bindings ------------------------------"

map <Tab> :NERDTreeToggle<CR>

xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> ll :call CocAction('format')<CR>

imap jj <Esc>

"------------------------------ Custom ------------------------------------"
"Coc auto completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

command! -nargs=0 Format :call CocAction('format')


"GTM
function! AirlineInit()
  if exists('*GTMStatusline')
    call airline#parts#define_function('gtmstatus', 'GTMStatusline')
    let g:airline_section_b = airline#section#create([g:airline_section_b, ' ', '[', 'gtmstatus', ']'])
  endif
endfunction
autocmd User AirlineAfterInit call AirlineInit()

let g:gtm_plugin_status_enabled = 1

" -------------------------- Neovide specific ------------------------
let g:neovide_refresh_rate=60
set guifont=FiraCode\ Nerd\ Font:h15
