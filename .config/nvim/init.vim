" #####################################
" ### Common Setting
" #####################################
" show row number
set number
hi LineNr ctermbg=0 ctermfg=0
hi CursorLineNr ctermbg=4 ctermfg=0
set cursorline
hi clear CursorLine
set noswapfile

" tab default
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
set smarttab

" font
set encoding=utf-8

" change tab setting in case by filetypes
filetype plugin indent on

" filetype
filetype on
au BufNewFile,BufRead *.etl.erb setf ruby
set fileencoding=utf-8
set ambiwidth=double

" Delete Highlight y Esc twice
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

" Complete brackets
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap <<Enter> <><Left><CR><ESC><S-o>

" Visualize Tab, Space, Emptyline
set list
set listchars=tab:>.,trail:･,extends:>,precedes:<,nbsp:%
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

" edit
set smartindent
set showmatch
set backspace=indent,eol,start
set virtualedit=block

" Search set ignorecase                         "検索時大文字小文字を区別しない
set smartcase
set incsearch
set nohlsearch
set wrapscan
set infercase

" Other
set wildmenu
set tw=0
set whichwrap=b,s,h,l,<,>,[,]
set cursorline
set clipboard=unnamed,unnamedplus
set hidden
set switchbuf=useopen
set vb t_vb=
set novisualbell
set nostartofline
set matchpairs& matchpairs+=<:>
set matchtime=3
set wrap
set textwidth=0
set shiftround
set history=10000
set mouse=a
inoremap <silent> jj <ESC>
inoremap <silent> っｊ <ESC>

" #####################################
" ### Python provider
" #####################################
let g:python_host_prog = $PYENV_ROOT.'/versions/2.7.14/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/anaconda3-5.2.0/bin/python'

" #####################################
" ### SETUP dein.vim
" #####################################
" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME

" {{{ dein
let s:dein_dir = expand('$CACHE/dein')

if &runtimepath !~# '/dein.vim'
    let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

    " Auto Download
    if !isdirectory(s:dein_repo_dir)
        call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
    endif

    execute 'set runtimepath^=' . s:dein_repo_dir
endif

" dein.vim settings

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    let s:toml_dir = expand('$CONFIG/dein')

    call dein#add('morhetz/gruvbox')
    call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})
    call dein#load_toml(s:toml_dir . '/ruby.toml', {'lazy': 1})
    call dein#load_toml(s:toml_dir . '/other.toml', {'lazy': 1})
    call dein#load_toml(s:toml_dir . '/python.toml', {'lazy': 1})
    call dein#load_toml(s:toml_dir . '/go.toml', {'lazy': 1})
    call dein#load_toml(s:toml_dir . '/html.toml', {'lazy': 1})
    call dein#load_toml(s:toml_dir . '/js.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif

syntax enable
colorscheme gruvbox
" }}}

" #####################################
" ### Tab Split settings
" #####################################
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap ; :

" #####################################
" ### Lazy plugin commands
" #####################################
" tagbar
nnoremap <silent><C-l> :TagbarToggle<CR>
" Denite
nmap <silent> <C-u><C-t> :<C-u>Denite filetype<CR>
nmap <silent> <C-u><C-p> :<C-u>Denite file_rec<CR>
nmap <silent> <C-u><C-j> :<C-u>Denite line<CR>
nmap <silent> <C-u><C-g> :<C-u>Denite grep<CR>
nmap <silent> <C-u><C-]> :<C-u>DeniteCursorWord grep<CR>
nmap <silent> <C-u><C-u> :<C-u>Denite file_mru<CR>
nmap <silent> <C-u><C-y> :<C-u>Denite neoyank<CR>
nmap <silent> <C-u><C-r> :<C-u>Denite -resume<CR>
nmap <silent> <C-u>; :<C-u>Denite -resume -immediately -select=+1<CR>
nmap <silent> <C-u>- :<C-u>Denite -resume -immediately -select=-1<CR>
nmap <silent> <C-u><C-d> :<C-u>call denite#start([{'name': 'file_rec', 'args': ['~/dotfiles']}])<CR>
nnoremap ml :<C-u>call denite#start([{'name': 'file_rec', 'args': [g:memolist_path]}])<CR>
" 補完のプレビューを消す
set completeopt-=preview
if exists('$TMUX')
  let &t_SI = "\ePtmux;\e\e[5 q\e\\"
  let &t_EI = "\ePtmux;\e\e[2 q\e\\"
else
  let &t_SI = "\e[5 q"
  let &t_EI = "\e[2 q"
endif

