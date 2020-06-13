" basic settings
syntax on "set file syntax to on
let mapleader = "\<space>" 
set nobackup "for coc.nvim
set nowritebackup "for coc.nvim
set bufhidden=hide "suspend closed buffers
set clipboard=unnamedplus "use system clipboard
set cmdheight=2 "larger area for commands
set cc=81,121 "set columns at 81 and 121
set cuc
set cul
hi ColorColumn ctermbg=0 "color for the columns
hi CursorColumn ctermbg=0 "color for the cursor
hi CursorLine ctermbg=0 "color for the cursor
set completeopt=longest,preview "for completion popups
set formatoptions-=c "don't auto insert newline comments
set hidden  "hide buffers rather than closing
set ignorecase "case insensitive search
set inccommand=split "show incsearch over splits
set mps+=<:> "match html pairs
set nu "set per line number
set preserveindent "preserve indent structure when indenting a line
set rnu "set relative numbers on all but current line
set noruler "remove line and column number from status
set shiftwidth=4 "autoindent tabs
set noshowcmd "do not show last command
set smartcase "search in smartcase
set softtabstop=4 "number of spaces a tab counts for
set sb "split below
set spr "split right
set shortmess+=c "remove messages from completion menus
set noswapfile "do not use swap when losing a file
set tabstop=4 "set tabs to 4 spaces
set termguicolors "use 256 colors
set timeoutlen=6000
set undofile "use an undofile
set undolevels=5000 "bigger undofile
set updatetime=50 "set lower update time for faster response
set signcolumn=yes "merge signcolumn and numbercolumn into one
set mouse=a "mice

"plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive' "git
Plug 'sheerun/vim-polyglot' "syntax
Plug 'wadackel/vim-dogrun' "colorscheme
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'APZelos/blamer.nvim'

call plug#end()

colorscheme dogrun

" keybinds
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <esc> :nohlsearch<CR>
nnoremap <Leader>so :so ~/.config/nvim/init.vim<CR>

" netrw
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=1
let g:netrw_winsize=25

" clap
nnoremap <Leader>p :Clap files<CR>
nnoremap <Leader>ln :Clap lines<CR>
nnoremap <Leader>y :Clap yanks<CR>
nnoremap <Leader>g :Clap grep2<CR>
nnoremap <Leader>f :Clap filer<CR>

" coc
" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" cr to confirm complete
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" go to def
nmap <silent> gd <Plug>(coc-definition)
" show docs
nnoremap <silent> gh :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader><leader>d  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <leader><leader>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <leader><leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader><leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader><leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader><leader>n  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader><leader>p  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader><leader>r  :<C-u>CocListResume<CR>
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" blamer
let g:blamer_prefix=' > '
let g:blamer_enabled=1
let g:blamer_delay=500
let g:blamer_date_format='%m%d%y %H:%M'
