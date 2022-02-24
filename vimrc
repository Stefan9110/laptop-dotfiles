" /\/|  __      _
"|/\/  / /_   _(_)_ __ ___  _ __ ___
"     / /\ \ / / | '_ ` _ \| '__/ __|
"    / /_ \ V /| | | | | | | | | (__
"   /_/(_) \_/ |_|_| |_| |_|_|  \___|

" --> Basic Settings <--

" Fix XDG Base Dir
set directory=$XDG_CACHE_HOME/vim/swap,~/,/tmp
set backupdir=$XDG_CACHE_HOME/vim/backup,~/,/tmp
set viewdir=$XDG_CACHE_HOME/vim/view
set undodir=$XDG_VIEW_HOME/vim/undo,~/,/tmp
set viminfofile=$XDG_STATE_HOME/vim/viminfo
set runtimepath+=$XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after,$VIM,$VIMRUNTIME
let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"

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
" UTF-8 encoding
set encoding=utf-8

" Set folding
set foldenable
autocmd Filetype c,cpp set foldmethod=indent
set foldmethod=manual

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" --> Plugins <--
call plug#begin('~/.config/vim/plugged')
Plug 'rhysd/vim-clang-format' " :ClangFormatC
Plug 'jiangmiao/auto-pairs' " Brackets pairs
Plug 'scrooloose/nerdtree' " File tree
Plug 'doums/darcula' " Color scheme
Plug 'valloric/youcompleteme' " Complex syntax completion and documentation preview
Plug 'tpope/vim-surround' " Easy bracket management
Plug 'bling/vim-airline' " Tmux like customization
Plug 'vim-airline/vim-airline-themes' " Airline themes
Plug 'bfrg/vim-cpp-modern' " Aditional C/C++ syntax highlight 
Plug 'vim-scripts/c.vim' " Comment support C/C++
Plug 'iamcco/markdown-preview.nvim' " Markdown viewer
call plug#end()

let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'

" C++/C format settings
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
  \ 'AllowShortFunctionsOnASingleLine'          : 'false',
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

" Bracket pairs
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}

" Airline theme
let g:airline_theme='owo'
let g:airline#extensions#tabline#enabled=1

" Set color scheme
colorscheme darcula
set termguicolors

" --> Key Maps <--
" Format C code
autocmd Filetype c,cpp map \ :ClangFormatC <Return>
" Compile and run C code
autocmd Filetype c,cpp map <F5> :w <Return> :!compandrun % <Return>
" Add ; at the end of the line
autocmd Filetype c,cpp map ; A ; <esc> :ClangFormatC <Return>
nnoremap <C-t> :NERDTreeToggle<CR>
