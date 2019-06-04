" 基本
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac"文字コードをuft-8に設定

" 保存するファイルをutf-8に指定
set fenc=utf-8

" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

set autoread
au CursorHold * checktime  

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

" xml,htmlの閉じタグ補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

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

"入力系
nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <CR> <CR>X<C-h>
tnoremap <C-w><C-w> <C-w><S-n>

""ctrl + j でノーマルモード
noremap <C-j> <esc>l
noremap! <C-j> <esc>l

noremap <S-h> ^  
noremap <S-l> $

noremap == gg=G

" {} の自動入力(改行あり)
inoremap {<Enter> {}<Left><CR><ESC><<O <C-h>


" 自作コマンド
" BashでwindowならばホームディレクトリでWSL起動unix系の場合カレントディレクトリでターミナル起動
if has ("win64")
  command! Bash terminal ++close ++rows=14 C:/WINDOWS/System32/bash.exe -c "cd; bash -l"
endif

if has ("unix")
  command! Bash terminal ++close ++rows=14 
endif

command! Vbash call Vbash()

" ターミナルを水平分割して開く
function! Vbash()
  vnew
  Bash
  wincmd k
  q!
endfunction

" プラグイン
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
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('scrooloose/nerdtree')
  call dein#add('w0rp/ale')
  call dein#add('posva/vim-vue')
  call dein#add('thinca/vim-quickrun')
  call dein#add('simeji/winresizer')
  call dein#add('tomasr/molokai')
  call dein#add('tomasiser/vim-code-dark')
  call dein#add('udalov/kotlin-vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('cohama/lexima.vim')
  call dein#add('ryanoasis/vim-devicons')
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

let g:winresizer_vert_resize = 3

"NERDTree
"autocmd VimEnter * execute 'NERDTree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeWinSize=15
map <C-n> :NERDTreeToggle<CR>
map <C-p> <C-w><C-t>
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

"Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1

" 初期設定コマンド
colorscheme codedark
syntax on
autocmd ColorScheme * highlight Visual ctermfg=242 

" easymotion
map <Leader> <Plug>(easymotion-prefix)
