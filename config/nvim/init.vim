" basic settings
let mapleader = "\<space>" 
syntax on "set file syntax to on
set expandtab "enter spaces when tab is pressed
set autoindent "copy indent from current line when starting new line
set nobackup "for coc.nvim
set nowritebackup "for coc.nvim
set clipboard=unnamedplus "use system clipboard
set cmdheight=2 "larger area for commands
set cc=120 "set columns
set termguicolors
set completeopt=menuone,noinsert,noselect "for completion popups
set formatoptions-=c "don't auto insert newline comments
set hidden  "hide buffers rather than closing
set ignorecase "case insensitive search
set inccommand=split "show incsearch over splits
set mps+=<:> "match html pairs
set nu "set per line number
set preserveindent "preserve indent structure when indenting a line
set rnu "set relative numbers on all but current line
set shiftwidth=4 "autoindent tabs
set noshowcmd "do not show last command
set smartcase "search in smartcase
set softtabstop=4 "number of spaces a tab counts for
set sb "split below
set spr "split right
set shortmess+=c "remove messages from completion menus
set noswapfile "do not use swap when losing a file
set tabstop=4 "set tabs to 4 spaces
set timeoutlen=6000
set undodir=~/.vim/undo-dir
set undofile "use an undofile
set undolevels=5000 "bigger undofile
set updatetime=50 "set lower update time for faster response
set signcolumn=yes "merge signcolumn and numbercolumn into one
set mouse=a "mice
set encoding=UTF-8
set scrolloff=0
filetype plugin on

" crystalline
function! StatusLine(current, width)
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  else
    let l:s .= '%#CrystallineInactive#'
  endif
  let l:s .= ' %f%h%w%m%r '
  if a:current
    let l:s .= crystalline#right_sep('', 'Fill') . ' %{fugitive#head()} '
    let l:s .= crystalline#right_sep('', 'Fill') . ' %{tagbar#currenttag(''%s'', '''', ''f'')} - %{tagbar#currenttagtype("(%s) ", '''')}'
  endif

  let l:s .= '%='
  if a:current
    let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
    let l:s .= crystalline#left_mode_sep('')
  endif
  if a:width > 80
    let l:s .= ' %{&ft}[%{&fenc!=#""?&fenc:&enc}][%{&ff}] %l/%L %c%V %P '
  else
    let l:s .= ' '
  endif

  return l:s
endfunction

function! TabLine()
  let l:vimlabel = has('nvim') ?  ' NVIM ' : ' VIM '
  return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
endfunction

set statusline+=%{tagbar#currenttag('[%s]\ ','')}

let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_theme = 'forest_night'

set showtabline=2
set guioptions-=e
set laststatus=2

"plugins
call plug#begin('~/.vim/plugged')

" Plug 'neoclide/coc.nvim', {'branch': 'release'} "lsp
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-commentary' "easy comments
Plug 'tpope/vim-surround' "surround motion
Plug 'tpope/vim-fugitive' "git
Plug 'nathanaelkane/vim-indent-guides' "show indent lines
Plug 'dyng/ctrlsf.vim' "search and replace
Plug 'jiangmiao/auto-pairs' "pairs
Plug 'tpope/vim-sleuth' "match current file indents
Plug 'sainnhe/forest-night' "colors
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'rbong/vim-crystalline'
Plug 'justinmk/vim-sneak'
Plug 'nvim-lua/completion-nvim'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'preservim/tagbar'

call plug#end()

colorscheme forest-night

let g:python_host_prog = expand('~/.virtualenvs/nvim2/bin/python2')
let g:python3_host_prog = expand('~/.virtualenvs/nvim3/bin/python')
let g:node_host_prog = expand('~/.nvm/versions/node/v14.15.4/bin/neovim-node-host')

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
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap <Leader>cc :cclose<CR>

"ctrlsf
let g:ctrlsf_auto_preview = 1

" indent line
let g:indent_guides_enable_on_vim_startup = 1

" treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enabled = true,
  },
  indent = {
    enabled = true
  },
}
EOF

" telescope
nnoremap <Leader>ff :lua require'telescope.builtin'.find_files{}<cr>
nnoremap <Leader>gf :lua require'telescope.builtin'.git_files{}<cr>
nnoremap <Leader>gs :lua require'telescope.builtin'.grep_string{}<cr>
nnoremap <Leader>gr :lua require'telescope.builtin'.live_grep{}<cr>
nnoremap <Leader>bu :lua require'telescope.builtin'.buffers{}<cr>
nnoremap <Leader>ru :lua require'telescope.builtin'.oldfiles{}<cr>
nnoremap <Leader>ta :lua require'telescope.builtin'.tags{}<cr>
nnoremap <Leader>bt :lua require'telescope.builtin'.current_buffer_tags{}<cr>
nnoremap <Leader>ts :lua require'telescope.builtin'.treesitter{}<cr>
nnoremap <Leader>gb :lua require'telescope.builtin'.git_branches{}<cr>

" ctrlsf
nnoremap <Leader>sf :CtrlSF <C-R><C-W><cr>
xnoremap <Leader>sf y:CtrlSF <C-R>"<cr>

" tagbar
nnoremap <Leader>tt :TagbarToggle<CR>

" nvim tree
let g:nvim_tree_side = 'right'
let g:nvim_tree_ignore = ['.git', 'node_modules', '.cache']
let g:nvim_tree_auto_close = 1
let g:nvim_tree_follow = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_width_allow_resize = 1
nnoremap <Leader>ntt :NvimTreeToggle<CR>
nnoremap <Leader>ntf :NvimTreeFindFile<CR>

" airline
let g:airline_theme='forest_night'

" sneak
let g:sneak#label = 1
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
xmap f <Plug>Sneak_s
xmap F <Plug>Sneak_S

" nvim lsp
lua << EOF
local nvim_lsp = require('lspconfig')

nvim_lsp.bashls.setup{}
nvim_lsp.cssls.setup{}
nvim_lsp.dockerls.setup{}
nvim_lsp.efm.setup{}
nvim_lsp.pyright.setup{}
nvim_lsp.tsserver.setup{}
nvim_lsp.vimls.setup{}
nvim_lsp.yamlls.setup{}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}

require'lspconfig'.jsonls.setup {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "pyright", "bashls", "cssls", "dockerls", "tsserver", "vimls", "yamlls", "jsonls", "html" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF

" completion-nvim
" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"map <c-p> to manually trigger completion
imap <silent> <c-p> <Plug>(completion_trigger)

let g:completion_enable_auto_popup = 1
let g:completion_trigger_on_delete = 1
