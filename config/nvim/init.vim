"----------------------------- Plugins (VimPlug)---------------------------" 

call plug#begin('~/.config/nvim/plugged')

"Tools
    "Plug 'vifm/vifm.vim'
    Plug 'preservim/nerdtree'
    Plug 'airblade/vim-gitgutter'
    Plug 'neoclide/coc.nvim' , { 'branch' : 'release' } " Code completion
    Plug 'tpope/vim-fugitive'

    
    Plug 'edwinb/idris2-vim', { 'for': 'idr' }          " Idris2 support
    Plug 'rust-lang/rust.vim', { 'for': 'rs' }          " Rust support
    Plug 'pangloss/vim-javascript', { 'for': 'js' }     " JavaScript support

    Plug 'DEVELOPEST/gtm-vim'

"Visual
    Plug 'tpope/vim-markdown'
    Plug 'ap/vim-css-color' "Displays a preview of colors with CSS
    Plug 'leafgarland/typescript-vim', { 'for': 'ts' }  " TypeScript syntax
    Plug 'maxmellon/vim-jsx-pretty', { 'for': 'jsx' }   " JS and JSX syntax
    Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['cpp', 'hpp', 'c', 'h', 'c++', 'h++'] } " C/C++ syntax
    Plug 'pboettch/vim-cmake-syntax', { 'for': 'CMakeLists.txt' }
    Plug 'neovimhaskell/haskell-vim', { 'for': 'hs' }
    Plug 'vim-airline/vim-airline'

"Color Schemes
    Plug 'morhetz/gruvbox'
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'jacoborus/tender.vim'

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
" Enable 24 bit colors
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme onehalfdark "gruvbox

hi DiffAdd guifg=NONE ctermfg=NONE guibg=#012800 ctermbg=238 gui=NONE cterm=NONE
hi DiffChange guifg=NONE ctermfg=NONE guibg=#082040 ctermbg=239 gui=NONE cterm=NONE
hi DiffDelete guifg=NONE ctermfg=NONE guibg=#340001 ctermbg=237 gui=NONE cterm=NONE

"set signcolumn=number

let g:coc_global_extensions = [ 'coc-tsserver', 'coc-json', 'coc-cmake', 'coc-css', 'coc-html', 'coc-java', 'coc-python', 'coc-rust-analyzer', 'coc-rls', 'coc-texlab', 'coc-toml', 'coc-yaml']

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"------------------------------ Key Bindings ------------------------------"

map <Tab> :NERDTreeToggle<CR>

xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> ll :call CocAction('format')<CR>

nnoremap <silent> D :call <SID>show_documentation()<CR>

imap jj <Esc>

autocmd CursorHold * silent call CocActionAsync('highlight')

" Git
set diffopt+=vertical
nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gs :G<CR>

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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" NerdTRee
let NERDTreeShowHidden=1

" Highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1

" GTM
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
