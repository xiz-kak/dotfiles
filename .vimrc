:set encoding=utf-8
:set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
:set fileformats=unix,dos,mac

:set number
:set title
:set smartindent

" :set encoding=utf-8
" :set fileencodings=utf-8

if has("syntax")
  syntax on
endif

"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:¶,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示
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

"クリップボード有効化
set clipboard+=unnamed

set backspace=indent,eol,start

" タブをスペースに展開
set expandtab
" タブを表示するときの幅
set tabstop=2
" cindentやシフトオペレータでタブを挿入するときの幅
set shiftwidth=2
" <tab>キーでタブを挿入するときの幅
set softtabstop=2

" 行番号の色
highlight LineNr ctermfg=yellow
