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
set list            " 不可視文字を表示する
"set listchars=eol:$,tab:>\ ,extends:< " 不可視文字の表示記号指定
set listchars=tab:>\ ,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
set ambiwidth=double " 記号が半角でずれるのを防ぐ

function! ZenkakuSpace() "全角スペースをハイライト表示
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
   
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif


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
set expandtab       " タブの代わりに空白文字挿入
set ts=2 sw=2 sts=0 " タブは半角2文字分のスペース
set shiftwidth=2    " インデントは半角2文字分のスペース
" set autoindent      " オートインデント
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

"set background=dark
"let g:solarized_termcolors=256
"colorscheme BusyBee
"colorscheme molokai
colorscheme frictionless
"colorscheme lucius

" fzfプラグイン
set rtp+=~/.fzf

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

filetype off

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
  \ }
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 't9md/vim-textmanip'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tomasr/molokai'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'
NeoBundle 'davidhalter/jedi-vim'

call neobundle#end()

filetype plugin indent on     " required!
filetype indent on
syntax on

NeoBundleCheck

" Jedi for python
NeoBundleLazy "davidhalter/jedi-vim", {
    \ "autoload": { "filetypes": [ "python", "python3", "djangohtml"] }}

if ! empty(neobundle#get("jedi-vim"))
  let g:jedi#auto_initialization = 1
  let g:jedi#auto_vim_configuration = 1

  nnoremap [jedi] <Nop>
  xnoremap [jedi] <Nop>
  nmap <Leader>j [jedi]
  xmap <Leader>j [jedi]

  let g:jedi#completions_command = "<C-m>"        " 補完キーの設定 Ctrl+Space
  let g:jedi#goto_assignments_command = "<C-g>"   " 変数の宣言場所へジャンプ（Ctrl + g)
  let g:jedi#goto_definitions_command = "<C-d>"   " クラス、関数定義にジャンプ（Ctrl + d）
  let g:jedi#documentation_command = "<C-k>"      " Pydocを表示（Ctrl + k）
  let g:jedi#rename_command = "[jedi]r"
  let g:jedi#usages_command = "[jedi]n"
  let g:jedi#popup_select_first = 0
  let g:jedi#popup_on_dot = 0

  autocmd FileType python setlocal completeopt-=preview

  " for w/ neocomplete
    if ! empty(neobundle#get("neocomplete.vim"))
        autocmd FileType python setlocal omnifunc=jedi#completions
        let g:jedi#completions_enabled = 0
        let g:jedi#auto_vim_configuration = 0
        let g:neocomplete#force_omni_input_patterns.python =
                        \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
    endif
endif
