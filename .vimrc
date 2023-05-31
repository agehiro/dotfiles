
"内部エンコードの指定
set encoding=utf-8
"vimスクリプトのエンコード指定
scriptencoding utf-8
"保存時の文字コード
set fileencoding=utf-8
"読み込み時の文字コードの自動判別. 左側が優先される
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
"改行コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac
"〇△を正常に表示
set ambiwidth=double
"保存されいないファイルが有るときでも別のファイルを開くことができる
set hidden

"---------- common ---------
" ビープ音を消す
set vb t_vb=
set novisualbell
set belloff=all
"右下のステータスバーにカーソルの行と列の番号を表示
set ruler
" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

"---------- view ---------
"シンタックス
syntax on
"画面上でタブ文字が占める幅
set tabstop=4
"連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4
"タブ使用時のスペースの表示数
set shiftwidth=4
"行番号表示
set number
"見えない文字を表示
set list
"見えない文字の表示の設定
"set listchars=tab:^\ ,trail:~
set listchars=tab:\|\ ,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
hi NonText    ctermbg=None ctermfg=59 guibg=NONE
hi SpecialKey ctermbg=None ctermfg=59 guibg=NONE
"メッセージの表示幅の指定
set cmdheight=2
"ステータス表示の設定(2常に表示)
set laststatus=2
"カーソル行の背景色を変える
set cursorline
"カーソル位置のカラムの背景色を変える
"set cursorcolumn
"行頭行末の左右移動で上下の行に移動
set whichwrap=b,s,h,l,<,>,~,[,]
"行末の1文字右までカーソルを移動をできるようにする
set virtualedit=onemore

highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight SpecialKey ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE
set background=light
"ファイル選択時の候補の表示
set wildmenu
"コマンドをステータス行に表示
set showcmd
"画面最後の行をできる限り表示する
set display=lastline

"---------- edit ---------
"バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
"クリップボードの共有
"set clipboard+=unnamed
"括弧の対応表示時間
set showmatch matchtime=1
"タブ入力を複数空白に
set expandtab
"自動的にインデントする
set autoindent
"ほとんどの言語に良い感じの自動的インデントを適用
set smartindent
"ヒストリの保存数
set history=5000
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
"+で数字をインクリメント
nnoremap + <C-a>
"-で数字をデクリメント
nnoremap - <C-x>

"外部でファイルに変更があったときに自動再読み込み
set autoread
"保存されていないときは終了前に確認(保存を確認するYes,No,Cancel選択の表示)
set confirm
 "常に補完ウィンドウを表示,補完ウィンドウを表示時に挿入しない
set completeopt=menuone,noinsert
" ファイルタイプ別のVimプラグイン/インデントを有効にする
filetype on
filetype plugin indent on


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
hi Search ctermbg=Cyan
hi Search ctermfg=White

"検索時にファイルの最後まで行ったら最初に戻る
set wrapscan


"Vimの「%」を拡張する
source $VIMRUNTIME/macros/matchit.vim

"マウスの有効化
"マウスでカーソル移動やスクロール移動が可能に
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif


"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
let vimplug_exists=expand('~/.vim/autoload/plug.vim')

let g:vim_bootstrap_langs = "javascript,python,c,php,html,go"
let g:vim_bootstrap_editor = "vim"

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  " Run shell script if exist on custom select language

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
"下部のステータスバー
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'deus'
let g:airline#extensions#tabline#enabled = 1

"Gitの変更箇所を左端に表示してくれる
Plug 'airblade/vim-gitgutter'

"シンタックスハイライトの表示を強化してくれる
Plug 'sheerun/vim-polyglot'

Plug 'vim-scripts/grep.vim'
Plug 'bronson/vim-trailing-whitespace'

"括弧の自動補完
Plug 'cohama/lexima.vim'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

"LSP利用するため
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'mattn/vim-goimports'


call plug#end()


"*****************************************************************************
"" Vim-Lsp
"*****************************************************************************
function! s:on_lsp_buffer_enabled() abort
    if &buftype ==# 'nofile' || &filetype =~# '^\(quickrun\)' || getcmdwintype() ==# ':'
        return
    endif
    " Language Serverが有効になったバッファに対する設定
    setlocal omnifunc=lsp#complete
    "nmap <buffer> gd <plug>(lsp-definition)
    "nmap <buffer> <f2> <plug>(lsp-rename)
    "nmap <buffer> <c-k> <plug>(lsp-hover)
endfunction

augroup vimrc_lsp_install
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
let g:lsp_diagnostics_enabled = 0 " Diagnosticsを有効にする




