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

au GUIEnter * simalt ~x

if has ("win64")
  set guifont=Osaka－等幅:h13
endif

if has ("unix")
  set guifont=Monospace\ Bold\ Italic\ 10
endif

syntax on
set t_Co=256
colorscheme molokai
