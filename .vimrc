colorscheme molokai " Molokai color scheme found in ~/.vim/colors
syntax enable 	    " Enable syntax highlighting

set tabstop=2 	    " Number of visual spaces per TAB
set softtabstop=2   " Number of spaces in TAB when editing
set shiftwidth=2    " Stop indenting a million spaces!
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

" nerdtree shortcuts
nnoremap <leader>b :NERDTreeToggle<cr>
nnoremap <leader>n :NERDTreeFind<cr>

" The Silver Searcher shortcuts
nnoremap <leader><S-k> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <leader>f :Ag 

" [vim-plug] section
call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot' " Multiple language packs bundled into one repository
Plug 'christoomey/vim-tmux-navigator' " Vim-Tmux Navigator
Plug 'jelera/vim-javascript-syntax' " Vim Enhanced Javascript Syntax
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy Finder
Plug 'christoomey/vim-tmux-runner' " Vim-Tmux-Runner
Plug 'terryma/vim-multiple-cursors' " Vim-Multiple-Cursors
Plug 'lukaszb/vim-web-indent' " Vim-Web-Indent
Plug 'scrooloose/nerdtree' " Nerdtree
Plug 'scrooloose/syntastic' " Syntastic (linters)
Plug 'scrooloose/nerdcommenter' " Nerd Commenter
Plug 'mtscout6/syntastic-local-eslint.vim' " Syntastic use local eslint
Plug 'rking/ag.vim' " The Silver Searcher plugin (requires the_silver_searcher)

call plug#end()

" Disable polyglot javascript
let g:polyglot_disabled = ['javascript']

" [vim-jsx] plugin settings
let g:jsx_ext_required = 0 " JSX highlighting in .js files

" [fzf] settings
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" [nerdtree] plugin settings
" > Open nerdtree when vim starts with no specified file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close vim if nerdtree is the only open window

" [syntastic] settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
let g:syntastic_javascript_checkers = ['eslint']

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" [The Silver Searcher] settings
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" [Nerd Commenter] settings
let g:NERDSpaceDelims = 1 " Spaces after comment delimiters
let g:NERDCompactSexyComs = 1 " Prettified mult-line comments
let g:NERDDefaultAlign = 'left' " Left-justify comment delimiters

" Write files including parent directories
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction

augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

