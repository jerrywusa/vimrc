autocmd VimEnter * execute "normal i"
autocmd BufEnter *.hack :syntax sync fromstart
autocmd BufEnter *.todo.md :match Title /^\<[A-Z]\+\>/
autocmd TermOpen * startinsert

" keep zf folds after quitting and reopening file
" augroup remember_folds
"   autocmd!
"   autocmd BufWinLeave ?* mkview
"   autocmd BufWinEnter ?* silent! loadview
" augroup END

filetype plugin indent on

" set tab spacing to 2
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype css setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype html setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype cpp setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype c setlocal ts=2 sw=2 sts=0 expandtab

" set tab spacing to 4
autocmd Filetype java setlocal ts=4 sw=4 sts=0 expandtab

syntax on
set belloff=esc,error,wildmode
set tabstop=4
set softtabstop=4
set whichwrap+=<,>,h,l
set shiftwidth=4
set clipboard=unnamed
set mouse=a
set completeopt=menuone,longest
set backspace=indent,eol,start
set foldmethod=manual
set expandtab
set smartindent
set autoindent
set nowrap
set smartcase
set noswapfile
set showmode
set incsearch
set nohlsearch
set ignorecase
set cursorline
set autochdir
set number
" set scrolloff=3
" set showcmd

set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

let &t_SI.="\e[6 q" " INSERT mode
let &t_EI.="\e[2 q" " NORMAL mode
let &t_SR.="\e[4 q" " REPLACE mode
" 1 -> blinking block
" 2 -> solid block 
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'flazz/vim-colorschemes'
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
Plug 'kshenoy/vim-signature'
Plug 'junegunn/goyo.vim'
Plug 'hhvm/vim-hack'
Plug 'aserebryakov/vim-todo-lists'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

colorscheme gruvbox
set background=dark

" netrw stuff
let g:netrw_banner = 0
let g:netrw_winsize = 75
let g:netrw_keepdir = 0
let g:netrw_altv = 1
let g:netrw_list_hide = 'Icon'

" goyo stuff
let g:goyo_width = 100
let g:goyo_height = 85

" vim-todo-lists plugin stuff
let g:VimTodoListsUndoneItem = '☐'
let g:VimTodoListsDoneItem = '✓'
let g:VimTodoListsMoveItems = 0
let g:VimTodoListsCustomKeyMapper = 'VimTodoListsCustomMappings'

" use ripgrep as default for fzf search
let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore-vcs --hidden'

"coc stuff
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

"coc autocomplete search highlight colorscheme
hi CocSearch ctermfg=109

" leader key
let mapleader = " "

" auto closing brackets
inoremap {<CR> {<CR>}<Esc>O

" auto surround highlighted text
" places cursor on closing character
vnoremap ( <ESC>`>a)<ESC>`<i(<ESC>`>2l
vnoremap ) <ESC>`>a)<ESC>`<i(<ESC>`>2l
vnoremap { <ESC>`>a}<ESC>`<i{<ESC>`>2l
vnoremap } <ESC>`>a}<ESC>`<i{<ESC>`>2l
vnoremap [ <ESC>`>a]<ESC>`<i[<ESC>`>2l
vnoremap ] <ESC>`>a]<ESC>`<i[<ESC>`>2l
vnoremap < <ESC>`>a><ESC>`<i<<ESC>`>2l
vnoremap > <ESC>`>a><ESC>`<i<<ESC>`>2l
vnoremap " <ESC>`>a"<ESC>`<i"<ESC>`>2l
vnoremap ' <ESC>`>a'<ESC>`<i'<ESC>`>2l

" movement between screens
nnoremap <Leader>H :wincmd h<CR>
nnoremap <Leader>L :wincmd l<CR>
nnoremap <Leader>K :wincmd k<CR>
nnoremap <Leader>J :wincmd j<CR>

" moving screens
nnoremap <C-h> :wincmd H<CR>
nnoremap <C-l> :wincmd L<CR>
nnoremap <C-k> :wincmd K<CR>
nnoremap <C-j> :wincmd J<CR>

" creating new window
nnoremap <Leader>\| :wincmd v<CR>
nnoremap <Leader>_ :wincmd s<CR>

" mimics command + arrow keys
nnoremap <Leader>h ^
nnoremap <Leader>l $
nnoremap <Leader>k gg
nnoremap <Leader>j G
vnoremap <Leader>h ^
vnoremap <Leader>l $
vnoremap <Leader>k gg
vnoremap <Leader>j G

" resizing screens
nnoremap <Leader>= :wincmd =<CR>
nnoremap <Leader>> :wincmd ><CR>
nnoremap <Leader>< :wincmd <<CR>
nnoremap <Leader>+ :wincmd +<CR>
nnoremap <Leader>- :wincmd -<CR>

" tab stuff
nnoremap tt :tab split<CR>
nnoremap th :tabp<CR>
nnoremap tl :tabn<CR>

" opens netrw side window to left
nnoremap <Leader>n :Lex <Bar> 
        \ :vertical resize 30<CR>

" opens terminal window at bottom
nnoremap <Leader>t :wincmd s <Bar>
            \:wincmd J <Bar>
            \:horizontal resize 10<Bar>
            \:term<CR>

" open undo tree
nnoremap <Leader>u :UndotreeToggle<CR>

" moving lines of code
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==

" moving blocks of code
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" indenting code with tab
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" making Y match D and C
nnoremap Y y$

" modify whole doc
nnoremap <Leader>y ggVGy
nnoremap <Leader>p ggVGp

" command remappings for common mistyping
command W write
command Q quit
command Wq write | quit
command WQ write | quit

" press esc in terminal mode to enter 'normal mode'
tnoremap <esc><esc> <C-\><C-N>

" toggle wrap mode
nnoremap <Leader>w :call ToggleWrapMode()<CR>

" switch to previously opened file
nnoremap <Leader>` <C-^>

" fzf file finder
nnoremap <Leader>f :Files<CR>

" fzf buffer finder
nnoremap <Leader>b :Buffers<CR>


" using alt key will send escape character. Adding these lines will remove the esc
let &t_TI = ""
let &t_TE = ""

" map dymga raise special df keys to move backward and forward a buffer
nnoremap <A-b> :bp<CR>
nnoremap <A-f> :bn<CR>

" ***************************************************************************
" ******************************** FUNCTIONS ********************************
" ***************************************************************************

function! ToggleWrapMode()
    if mapcheck("j") == "" 
        exec "set wrap"
        exec "nnoremap j gj"
        exec "nnoremap k gk"
        exec "vnoremap j gj"
        exec "vnoremap k gk"
        exec "nnoremap <Leader>h g^"
        exec "nnoremap <Leader>l g$"
        exec "vnoremap <Leader>h g^"
        exec "vnoremap <Leader>l g$"
        exec "nnoremap A g$a"
        exec "nnoremap I g^i"
        exec "nnoremap dd g^vg$d"
        exec "nnoremap yy g^vg$y"
        exec "nnoremap V g^vg$"
        echo "WrapMode enabled"
    else
        exec "set nowrap"
        unmap j
        unmap k
        exec "nnoremap <Leader>h ^"
        exec "nnoremap <Leader>l $"
        exec "vnoremap <Leader>h ^"
        exec "vnoremap <Leader>l $"
        unmap A
        unmap I
        unmap dd
        unmap yy
        unmap V
        echo "WrapMode disabled"
    endif
endfunction

function! VimTodoListsCustomMappings()
  nnoremap <Leader><Leader> :VimTodoListsToggleItem<CR>
  vnoremap <Leader><Leader> :VimTodoListsToggleItem<CR>
  nnoremap j j
  nnoremap <Leader>o :VimTodoListsCreateNewItemBelow<CR>
  nnoremap <Leader>O :VimTodoListsCreateNewItemAbove<CR>
endfunction
