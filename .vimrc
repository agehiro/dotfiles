"---------- common ---------
"vi1互換モードを外す
set nocompatible
"内部エンコードの指定
set encoding=utf-8
"vimスクリプトのエンコード指定
scriptencoding utf-8
" ビープ音を消す
set vb t_vb=
set novisualbell
"右下のステータスバーにカーソルの行と列の番号を表示
set ruler
" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

"---------- view ---------
"シンタックス
syntax on
"タブ使用時のスペースの表示数
set tabstop=4 shiftwidth=4 softtabstop=0
"行番号表示
set number
"見えない文字を表示
set list
"見えない文字の表示の設定
set listchars=tab:^\ ,trail:~
"メッセージの表示幅の指定
set cmdheight=2
"ステータス表示の設定(2常に表示)
set laststatus=2
"カーソル行の背景色を変える
set cursorline
"カーソル位置のカラムの背景色を変える
"set cursorcolumn
"カラースキーマ
colorscheme peachpuff
"背景色の指定
set background=light
"ファイル選択時の候補の表示
set wildmenu
"set wildmode=list:full
"コマンドをステータス行に表示
set showcmd
"画面最後の行をできる限り表示する
set display=lastline



"---------- edit ---------
"バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
"クリップボードの共有
set clipboard+=unnamed
"括弧の対応表示時間
set showmatch matchtime=1
"自動的にインデントする
set autoindent
"ほとんどの言語に良い感じの自動的インデントを適用
set smartindent
"ヒストリの保存数
set history=100
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
"+で数字をインクリメント
nnoremap + <C-a>
"-で数字をデクリメント
nnoremap - <C-x>


"---------- search ---------
"検索時の大文字小文字無視
set ignorecase
"大文字で始めた場合大文字小文字は無視しない
set smartcase
"検索時にファイルの最後まで行ったら最初に戻る
set wrapscan
"インクリメンタルサーチ
set incsearch
"検索文字の強調表示
set hlsearch
"検索時にファイルの最後まで行ったら最初に戻る
set wrapscan



"pluginを使用可能にする
filetype plugin indent on
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END



