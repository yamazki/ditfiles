" ウィンドウの縦幅
set lines=55
" ウィンドウの横幅
set columns=180
" カラースキーム
colorscheme industry
" ダーク系のカラースキームを使う
set background=dark

"hide menuBar
set guioptions-=m

"hide toolBar
set guioptions-=T

"hide scroll bar
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b

au GUIEnter * simalt ~x

"set font
if has ("win64")
  set guifont=Osaka－等幅:h12
endif

if has ("unix")
  set guifont=Monospace\ Bold\ Italic\ 10
endif


"use color schemt molokai
syntax on
autocmd ColorScheme * highlight Visual ctermfg=242 
colorscheme molokai

