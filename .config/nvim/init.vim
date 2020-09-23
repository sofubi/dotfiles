" basic settings
syntax on "set file syntax to on
set expandtab "enter spaces when tab is pressed
set autoindent "copy indent from current line when starting new line
let mapleader = "\<space>" 
set noshowmode "let lightline show the mode
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
set undodir=~/.vim/undo-dir
set undofile "use an undofile
set undolevels=5000 "bigger undofile
set updatetime=50 "set lower update time for faster response
set signcolumn=yes "merge signcolumn and numbercolumn into one
set mouse=a "mice
filetype plugin on

"plugins
call plug#begin('~/.vim/plugged')

Plug 'honza/vim-snippets' "snippets
Plug 'unblevable/quick-scope' "movement reminders
Plug 'itchyny/lightline.vim' "statusline
Plug 'neoclide/coc.nvim', {'branch': 'release'} "lsp
Plug 'tpope/vim-commentary' "easy comments
Plug 'tpope/vim-surround' "surround motion
Plug 'vim-scripts/ReplaceWithRegister' "replace in motion
Plug 'tpope/vim-fugitive' "git
Plug 'sheerun/vim-polyglot' "syntax
Plug 'wadackel/vim-dogrun' "colorscheme
Plug 'tomasiser/vim-code-dark' "colorscheme
Plug 'junegunn/fzf' "ctrlp and others
Plug 'junegunn/fzf.vim' "ctrlp and others
Plug 'APZelos/blamer.nvim' "git blame per line
Plug 'Yggdroot/indentLine' "show indent lines
Plug 'dyng/ctrlsf.vim' "search and replace
Plug 'mbbill/undotree' "undotree
Plug 'dbeniamine/todo.txt-vim' "todo.txt
Plug 'vimwiki/vimwiki' "journal
Plug 'junegunn/goyo.vim' "zen
Plug 'junegunn/limelight.vim' "zen

call plug#end()

colorscheme codedark
let g:clap_theme='dogrun'

let g:python_host_prog = '/home/sofubi/.virtualenvs/nvim2/bin/python2'
let g:python3_host_prog = '/home/sofubi/.virtualenvs/nvim3/bin/python'
let g:node_host_prog = expand('~/.config/nvm/versions/node/v12.18.3/bin/neovim-node-host')

" keybinds
nnoremap <esc> :nohl<CR>
nnoremap <c-h> :wincmd h<CR>
nnoremap <c-j> :wincmd j<CR>
nnoremap <c-k> :wincmd k<CR>
nnoremap <c-l> :wincmd l<CR>
nnoremap <A-h> :tabp<cr>
nnoremap <A-l> :tabn<cr>
nnoremap <A-c> :tabclose<cr>
nnoremap <Leader><Leader>t :tabe term://.//zsh<cr>
nnoremap <Leader>so :so ~/.config/nvim/init.vim<CR>
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap <A-j> :m .+1<CR>==
vnoremap > >gv
vnoremap < <gv

" fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <Leader>p :GFiles<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :Rg<CR>
nnoremap <Leader>w :Rg <C-R><C-W><space><CR>
let g:fzf_preview_window = 'right:60%'

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
" show explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\      'root-uri': '~/.vim',
\   },
\   'floating': {
\      'position': 'floating',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\   },
\   'floatingLeftside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\   },
\   'floatingRightside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }
nmap <silent> <leader>e :CocCommand explorer --preset floating<CR>
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
" Show actions for current line.
nnoremap <silent><nowait> <leader><leader>a  :<C-u>CocList actions<cr>
" Show commands.
nnoremap <silent><nowait> <leader><leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader><leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader><leader>s  :<C-u>CocList -I symbols<cr>
" Resume latest coc list.
nnoremap <silent><nowait> <leader><leader>r  :<C-u>CocListResume<CR>

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" blamer
let g:blamer_prefix=' > '
let g:blamer_delay=500
let g:blamer_date_format='%m/%d/%y %H:%M'

" lightline

function! CocCurrentFunction()
	return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
	\ 'colorscheme': 'deus',
	\ 'active': {
	\	'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'FugitiveHead',
	\   'cocstatus': 'coc#status',
	\   'currentfunction': 'CocCurrentFunction'
	\ },
	\}

"ctrlsf
let g:ctrlsf_auto_preview = 1

"todo.txt
" Use todo#Complete as the omni complete function for todo files
au filetype todo setlocal omnifunc=todo#Complete

" Auto complete projects
au filetype todo imap <buffer> + +<C-X><C-O>

" Auto complete contexts
au filetype todo imap <buffer> @ @<C-X><C-O>

" completion menu with one item
au filetype todo setlocal completeopt+=menuone

"zen
nnoremap <leader>z :Goyo<cr>
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"journal
let g:vimwiki_list = [{'path': '$HOME/Documents/notebook/'}]
