" <[VIM SETTINGS]>
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

let mapleader=" " " Set leader key to <space>

autocmd VimResized * :wincmd = "automatically rebalance windows on vim resize

" <[VIM BINDINGS]>
" Highlight last inserted text
nnoremap gv `[v`]

" Turn off search highlighting with , + SPACE
nnoremap <leader>/ :nohlsearch<CR>

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Zoom a vim pane, <C-w>= to rebalance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

set backspace=indent,eol,start " Backspace should always work as expected

" Tab bindings
nnoremap <leader>t :tabedit<cr>
nnoremap <leader><Right> :tabn<cr>
nnoremap <leader><Left> :tabp<cr>

" Write and Quit
nnoremap <leader>w :w<cr>
nnoremap <leader>qw :wq<cr>
nnoremap <leader>qq :q!<cr>

" <[VIM PLUGINS]>
call plug#begin('~/.vim/plugged')

Plug 'sainnhe/gruvbox-material' " Color palettes
Plug 'sheerun/vim-polyglot' " Multiple language packs bundled into one repository
Plug 'christoomey/vim-tmux-navigator' " Vim-Tmux Navigator
Plug 'jelera/vim-javascript-syntax' " Vim Enhanced Javascript Syntax
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy Finder
Plug 'christoomey/vim-tmux-runner' " Vim-Tmux-Runner
Plug 'terryma/vim-multiple-cursors' " Vim-Multiple-Cursors
Plug 'lukaszb/vim-web-indent' " Vim-Web-Indent
Plug 'scrooloose/nerdtree' " Nerdtree
Plug 'dense-analysis/ale' " Vim8 Async Linters
Plug 'scrooloose/nerdcommenter' " Nerd Commenter
Plug 'rking/ag.vim' " The Silver Searcher plugin (requires the_silver_searcher)
Plug 'thoughtbot/vim-rspec' " Vim-Rspec
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompletion
Plug 'vim-ruby/vim-ruby' " Ensure the latest version of vim-ruby
Plug 'artur-shaik/vim-javacomplete2' " JavaComplete2
Plug 'ludovicchabant/vim-gutentags' " Automatic CTags

call plug#end()

" <[PLUGIN SETTINGS]>
" Gruvbox colors settings
if has('termguicolors')
  set termguicolors
endif

" Gruvbox Enable True Colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material

" Disable polyglot javascript
let g:polyglot_disabled = ['javascript']

" Vim-JSX plugin settings
let g:jsx_ext_required = 0 " JSX highlighting in .js files

" FZF settings
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" Nerdtree plugin settings
" > Open nerdtree when vim starts with no specified file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close vim if nerdtree is the only open window

" Ale settings
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'

" The Silver Searcher settings
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Nerd Commenter settings
let g:NERDSpaceDelims = 1 " Spaces after comment delimiters
let g:NERDCompactSexyComs = 1 " Prettified mult-line comments
let g:NERDDefaultAlign = 'left' " Left-justify comment delimiters
let NERDTreeShowHidden=1 " Show hidden files and folders

" Vim Rspec settings
let g:rspec_command = "call VtrSendCommand('bundle exec rspec {spec}')"

" Matchit - enable
runtime macros/matchit.vim

" coc.vim settings
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Gutentags status display setting
set statusline+=%{gutentags#statusline()}

" <[PLUGIN BINDINGS]>
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

" Vim-Rspec shortcuts
map <Leader>rf :call RunCurrentSpecFile()<CR>
map <Leader>rr :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

" JavaComplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F5> <Plug>(JavaComplete-Imports-Add)

" <[CUSTOM FUNCTIONALITY]>
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

augroup rubypath
  autocmd!
  autocmd FileType ruby setlocal suffixesadd+=.rb
augroup END

