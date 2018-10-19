set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac"文字コードをuft-8に設定
" バックアップファイルを作らない

" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

" 見た目系
" 行番号を表示
set number
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest

set autoindent
set splitright
set splitbelow
set expandtab
set tabstop=2
set shiftwidth=2
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2

let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1

" 検索系
" 検索文字列Sが小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

set backspace=indent,eol,start

nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <CR> <CR>X<C-h>
tnoremap <C-w><C-w> <C-w><S-n>

"入力系
noremap <C-j> <esc>l
noremap! <C-j> <esc>l

noremap <S-h> ^  
noremap <S-l> $

noremap == gg=G

inoremap {<Enter> {}<Left><CR><ESC><<O <C-h>
inoremap [<Enter> []<Left><CR><ESC><<O <C-h>
"自作コマンド
"BashでwindowならばホームディレクトリでWSL起動unix系の場合カレントディレクトリでターミナル起動
if has ("win64")
  command! Bash terminal ++close ++rows=14 C:/WINDOWS/System32/bash.exe -c "cd; bash -l"
endif
if has ("unix")
  command! Bash terminal ++close ++rows=14 
endif

if &compatible
  set nocompatible
endif

" dein自体の自動インストール
if has ("win64")
  let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache/windows64') : $XDG_CACHE_HOME
endif
if has ("unix")
  let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache/unix') : $XDG_CACHE_HOME
endif
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neosnippet')
  call dein#add('scrooloose/nerdtree')
  call dein#add('w0rp/ale')
  call dein#add('thinca/vim-quickrun')
  call dein#add('simeji/winresizer')
  call dein#add('tomasr/molokai')
  call dein#add('tomasiser/vim-code-dark')
  call dein#add('udalov/kotlin-vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  if has('python3')
    call dein#add('Shougo/denite.nvim')
  endif
    call dein#add('Shougo/unite.vim')
  call dein#end()
endif

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

"autocmd VimEnter * execute 'NERDTree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeWinSize=15
map <C-n> :NERDTreeToggle<CR>
map <C-p> <C-w><C-t>

"Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme = 'tomorrow'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif


" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

Bash
colorscheme codedark
syntax on
autocmd ColorScheme * highlight Visual ctermfg=242 
