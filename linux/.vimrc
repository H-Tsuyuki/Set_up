syntax on
colorscheme monokai_pro
set t_Co=256
set backspace=start,indent,eol
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

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


"---------------------------------------------------------------------
" SSH端末上の Vim からローカルにコピーする | blog.remora.cx
" http://blog.remora.cx/2011/08/yank-to-local-clipboard-from-vim-on-screen.html
"---------------------------------------------------------------------
" <Leader>yで最後のヤンクをローカルにコピー
let g:y2r_config = {
            \   'tmp_file': expand('$HOME') . '/.screen_exchange',
            \   'key_file': expand('$HOME') . '/.exchange.key',
            \   'host': 'localhost',
            \   'port': 52224,
            \}
function Yank2Remote()
    call writefile(split(@", '\n'), g:y2r_config.tmp_file, 'b')
    let s:params = ['cat %s %s | nc -w1 %s %s']
    for s:item in ['key_file', 'tmp_file', 'host', 'port']
        let s:params += [shellescape(g:y2r_config[s:item])]
    endfor
    let s:ret = vimproc#system_bg(call(function('printf'), s:params))
endfunction

" cygwinの場合はローカルで動作しているとみなしてコピーを設定しない
if !has('win32unix')
  nnoremap <silent> <unique> <Leader>y :call Yank2Remote()<CR>
  nmap <silent> yy  yy:call Yank2Remote()<CR>
  nmap <silent> y$  y$:call Yank2Remote()<CR>
  nmap <silent> yG  yG:call Yank2Remote()<CR>
  nmap <silent> dG  dG:call Yank2Remote()<CR>
  nmap <silent> yw  yw:call Yank2Remote()<CR>
  nmap <silent> yiw yiw:call Yank2Remote()<CR>
  nmap <silent> dd  dd:call Yank2Remote()<CR>
  nmap <silent> d$  d$:call Yank2Remote()<CR>
  nmap <silent> D   D:call Yank2Remote()<CR>
  nmap <silent> Y   Y:call Yank2Remote()<CR>
  vmap <silent> y   y:call Yank2Remote()<CR>
  vmap <silent> d   d:call Yank2Remote()<CR>
endif


"===========================================
"キーマッピング
"===========================================
inoremap <C-c> <Esc>    "Esc押しづらいので入れておく



"---------------------------------------------------------------------
" neobundle
"---------------------------------------------------------------------
filetype plugin indent off     " Required!
if has('vim_starting')
  if has('win32') " WindowsのGVIMなら
    set runtimepath+=C:/cygwin/home/tm/.vim/bundle/neobundle.vim
    call neobundle#begin('C:/cygwin/home/tm/.vim/bundle')
  else
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle'))
  endif
endif
  let g:neobundle_default_git_protocol='https'
  NeoBundleFetch 'Shougo/neobundle.vim'

  " Installation check.
  if neobundle#exists_not_installed_bundles()
    echomsg 'Not installed bundles : ' .
          \ string(neobundle#get_not_installed_bundle_names())
    echomsg 'Please execute ":NeoBundleInstall" command.'
    "finish
  endif

  " ---- repository on github ----

  NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ }

call neobundle#end()
filetype plugin indent on     " Required!

" ファイルを開いたときのテンプレート
"autocmd BufNewFile *.sh 0r ~/Templates/shell.sh
"autocmd BufNewFile *.py 0r ~/Templates/python.py
