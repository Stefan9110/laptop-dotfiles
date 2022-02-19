" /\/|  __      _
"|/\/  / /_   _(_)_ __ ___  _ __ ___
"     / /\ \ / / | '_ ` _ \| '__/ __|
"    / /_ \ V /| | | | | | | | | (__
"   /_/(_) \_/ |_|_| |_| |_|_|  \___|

" --> Basic Settings <--

" Disable vi compatibility
set nocompatible

" File type detection
filetype on

" Enable plugins
filetype plugin on

" Filetype indentation
filetype indent on

" Syntax highting
syntax on

" Line notation
set number

" Shift width
set shiftwidth=4

" Tab width
set tabstop=4

" Highlight search
set incsearch

" Enable autocomplete for commands
set wildmenu
set wildmode=list:longest

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'rhysd/vim-clang-format'
Plug 'justmao945/vim-clang'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
let g:clang_format#code_style = 'webkit'
let g:clang_format#style_options = {
  \ 'BasedOnStyle'                              : 'WebKit',
  \ 'AlignAfterOpenBracket'                     : 'Align',
  \ 'AlignConsecutiveAssignments'               : 'false',
  \ 'AlignConsecutiveDeclarations'              : 'false',
  \ 'AlignEscapedNewlinesLeft'                  : 'true',
  \ 'AlignTrailingComments'                     : 'true',
  \ 'AllowAllParametersOfDeclarationOnNextLine' : 'false',
  \ 'AllowShortBlocksOnASingleLine'             : 'false',
  \ 'AllowShortCaseLabelsOnASingleLine'         : 'false',
  \ 'AllowShortFunctionsOnASingleLine'          : 'true',
  \ 'AllowShortIfStatementsOnASingleLine'       : 'true',
  \ 'AllowShortLoopsOnASingleLine'              : 'true',
  \ 'AlwaysBreakAfterReturnType'                : 'None',
  \ 'AlwaysBreakBeforeMultilineStrings'         : 'true',
  \ 'BinPackArguments'                          : 'true',
  \ 'BinPackParameters'                         : 'true',
  \ 'BreakBeforeBinaryOperators'                : 'None',
  \ 'BreakBeforeBraces'                         : 'Attach',
  \ 'ColumnLimit'                               : '120',
  \ 'DerivePointerAlignment'                    : 'false',
  \ 'IndentCaseLabels'                          : 'true',
  \ 'IndentWidth'                               : '4',
  \ 'MaxEmptyLinesToKeep'                       : '1',
  \ 'PointerAlignment'                          : 'Left',
  \ 'SortIncludes'                              : 'false',
  \ 'SpaceBeforeAssignmentOperators'            : 'true',
  \ 'SpaceBeforeParens'                         : 'ControlStatements',
  \ 'SpaceInEmptyParentheses'                   : 'false',
  \ 'SpacesInCStyleCastParentheses'             : 'false',
  \ 'SpacesInParentheses'                       : 'false',
  \ 'SpacesInSquareBrackets'                    : 'false',
  \ 'TabWidth'                                  : '4',
  \ 'UseTab'                                    : 'ForIndentation',
  \ }
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
let g:airline_theme='owo'

" --> Key Maps <--
" Format C code
autocmd Filetype c,cpp map \ :ClangFormatC <Return>
autocmd Filetype c,cpp map <F5> :w <Return> :!compandrun % <Return>
autocmd Filetype c,cpp map ; A ; <esc> :ClangFormatC <Return>
autocmd Filetype c,cpp imap <Tab> <C-n> 
