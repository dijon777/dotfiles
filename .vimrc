set nocompatible    "vi互換モードではなく起動

set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

" 画面表示
set number          " 行番号表示
set cursorline      " カーソル行の背景色を変える
set t_Co=256
"set cursorcolumn    " カーソル位置のカラムの背景色を変える
set laststatus=2    " ステータスラインを常に表示
set cmdheight=2     " メッセージ表示欄を2行確保
set showcmd         " 入力中のコマンドをステータスに表示する
set showmatch       " 括弧入力時の対応する括弧を表示
set showmode        " モード表示
set title           " 編集中のファイル名を表示
set ruler           " ルーラーの表示
"set list            " 不可視文字を表示する
set listchars=eol:$,tab:>\ ,extends:< " 不可視文字の表示記号指定


" カーソル移動関連
set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
"set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う


" ファイル
set hidden          " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
" ファイルを開いた際に、前回終了時の行で起動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
set autoread        " 外部でファイルに変更がされた場合は読みなおす
set nobackup        " ファイル保存時にバックアップファイルを作らない
set noswapfile      " ファイル編集中にスワップファイルを作らない

set visualbell      " ビープのかわりに画面フラッシュ
set vb t_vb=        " ビープ無音

" タブ関連
" set expandtab       " タブの代わりに空白文字挿入
set ts=2 sw=2 sts=0 " タブは半角4文字分のスペース
set autoindent      " オートインデント
" set smartindent     " オートインデント
set smarttab

" 検索/置換
set ignorecase      " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase       " 検索文字列に大文字が含まれている場合は区別して検索する
set nowrapscan      " 検索時に最後まで行ったら最初に戻らない
set incsearch       " 検索文字列入力時に順次対象文字列にヒットさせる
set hlsearch        " 検索結果文字列のハイライト表示

:helptags ~/.vim/doc

" その他
set clipboard=unnamed   " クリップボードに自動でコピー
set shellslash          " Windows でもパスの区切り文字を / にする
"set iminsert=2          " インサートモードから抜けると自動的にIMEをオフにする

" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full

"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/


" Color Scheme
syntax enable
syntax on           " カラー表示
syntax sync minlines=200

set background=dark
let g:solarized_termcolors=256
colorscheme BusyBee
"colorscheme molokai

" fzfプラグイン
set rtp+=~/.fzf
