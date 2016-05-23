colorscheme molokai " Molokai color scheme found in ~/.vim/colors
syntax enable 	    " Enable syntax highlighting

set tabstop=2 	    " Number of visual spaces per TAB
set softtabstop=2   " Number of spaces in TAB when editing
set expandtab       " TABs are spaces

set number 	    " Show line numbers
set showcmd  	    " Show command in bottom bar
set cursorline      " Highlight current line
filetype indent on  " Load filetype-specific indent files
set wildmenu        " Visual autocomplete for command menu
set lazyredraw      " Redraw only when absolutely necessary
set showmatch       " Highlight matching [{()}]

set incsearch       " Search as characters are entered
set hlsearch 	    " Highlight matches

" Turn off search highlighting with , + SPACE
nnoremap <leader><space> :nohlsearch<CR>

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Highlight last inserted text
nnoremap gv `[v`]

autocmd VimResized * :wincmd = "automatically rebalance windows on vim resize

let mapleader=" "

" Zoom a vim pane, <C-w>= to rebalance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Fuzzy File Finder shortcuts
nnoremap <leader>p :FZF<cr>
nnoremap <leader><S-p> :FZF ~<cr>

" Vim Tmux Runner shortcuts
nnoremap <leader>a :VtrAttachToPane<cr>
nnoremap <leader>s :VtrSendCommand 

" Vim tab shortcuts
nnoremap <leader>[ :tabp<cr>
nnoremap <leader>] :tabn<cr>

" [vim-plug] section
call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot' " Multiple language packs bundled into one repository
Plug 'christoomey/vim-tmux-navigator' " Vim-Tmux Navigator
Plug 'jelera/vim-javascript-syntax' " Vim Enhanced Javascript Syntax
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy Finder
Plug 'christoomey/vim-tmux-runner' " Vim-Tmux-Runner
Plug 'terryma/vim-multiple-cursors' " Vim-Multiple-Cursors
Plug 'lukaszb/vim-web-indent' " Vim-Web-Indent

call plug#end()

" Disable polyglot javascript
let g:polyglot_disabled = ['javascript']

" [vim-jsx] plugin settings
let g:jsx_ext_required = 0 " JSX highlighting in .js files

