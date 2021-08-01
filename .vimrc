" NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
" NeoBundle 'Shougo/neosnippet.vim'
" NeoBundle 'Shougo/neosnippet-snippets'
" NeoBundle 'tpope/vim-fugitive'
" NeoBundle 'flazz/vim-colorschemes'
" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
"" Unite.vimで最近使ったファイルを表示できるようにする
"NeoBundle 'Shougo/neomru.vim'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'
" クウォートとかタグの入れ替え等
NeoBundle 'tpope/vim-surround'

" You can specify revision/branch/tag.
" NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"END NeoBundle Scripts-----------------------------

" file encode
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set number
" 行番号の色
highlight LineNr ctermfg=yellow
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" show file name in title bar
set title
" indent smartly
set smartindent
"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:¶,extends:>,precedes:<,nbsp:%
" クリップボード有効化
set clipboard+=unnamed,autoselect
" バックスペースを行またぎとかでも有効に
set backspace=indent,eol,start
" タブをスペースに展開
set expandtab
" タブを表示するときの幅
set tabstop=2
" cindentやシフトオペレータでタブを挿入するときの幅
set shiftwidth=2
" <tab>キーでタブを挿入するときの幅
set softtabstop=2
" コマンドラインに使われる画面上の行数
set cmdheight=1
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" 行を強調表示
set cursorline
autocmd ColorScheme * hi CursorLine   cterm=NONE ctermbg=Blue "ctermfg=white
" 列を強調表示
set cursorcolumn
autocmd ColorScheme * hi CursorColumn cterm=NONE ctermbg=Blue "ctermfg=white
" 暗い背景色に合わせた配色にする
set background=dark
colorscheme desert
" 検索結果をハイライト表示する
set hlsearch
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]]

set ignorecase
set smartcase

if has("syntax")
  syntax on
endif

"NERDTree設定-----------------------------
let NERDTreeWinSize=26
"END NERDTree設定-------------------------

"全角スペースをハイライト表示-------------
function! ZenkakuSpace()
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
"END 全角スペースをハイライト表示----------

"Unit.vim settings-------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=0
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを横に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
"END Unit.vim settings---------------------

