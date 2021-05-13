syntax on
colorscheme monokai_pro
set t_Co=256
set backspace=start,indent,eol
"---------------------------------------------------------
"検索
"---------------------------------------------------------
"インクリメンタルサーチを行う
set incsearch
"検索結果をハイライト
set hlsearch
"検索がファイル末尾まで進んだら、ファイル先頭から再検索
set wrapscan
"大文字小文字の区別をしない
set ignorecase
"検索時小文字で入力すると、大文字と小文字の区別なく検索
set smartcase
"---------------------------------------------------------
"表示設定
set nowrap
"if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
 "   let &t_SI ="\e]50;CursorShape=1\x7"
" ノーマルモード時に非点滅のブロックタイプのカーソル
"    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
"    let &t_SR .= "\e[4 q"
"endif
"---------------------------------------------------------
"不可視文字の表示
"カーソルラインをハイライト
set cursorline
"行番号
set number
"入力モードでTabキー押下時に半角スペース
set expandtab
"Tabキー移動幅
set softtabstop=4
"インデント幅。自動インデントに影響
set shiftwidth=4
"対応する括弧を強調
set showmatch matchtime=1
"新しい行を作ったとき高度な自動インデント
set smartindent
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"ウィンドウの右下に入力中のコマンド表示
set showcmd
"コマンドラインの履歴を10000件保存
set history=10000
"新しい行のインデントを現在行と同じにする
set autoindent
"タイトルを表示
set title
"ヤンクでクリップボードをwindowsと連携
set clipboard=autoselect
set clipboard+=unnamedplus
"エンコード
set encoding=utf-8
set fileencoding=utf-8
"右下に行・列表示
set ruler
"常にステータスを2行表示
set laststatus=2
"モードを表示
set showmode
"コメントの色を水色
hi Comment ctermfg=grey
"カッコの補間
inoremap { {}<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
"Esc押しづらいので入れておく
inoremap <C-c> <Esc>

