autocmd VimEnter * execute "normal i"
autocmd BufEnter *.hack :syntax sync fromstart
autocmd BufEnter *.todo.md :match Title /^\<[A-Z]\+\>/

" keep zf folds after quitting and reopening file
augroup remember_folds
  autocmd!
  autocmd BufWinLeave ?* mkview
  autocmd BufWinEnter ?* silent! loadview
augroup END

filetype plugin indent on

" set tab spacing to 2
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype css setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype html setlocal ts=2 sw=2 sts=0 expandtab

" set tab spacing to 4
autocmd Filetype java setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype c++ setlocal ts=4 sw=4 sts=0 expandtab

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
Plug 'flazz/vim-colorschemes'
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'
Plug 'junegunn/goyo.vim'
Plug 'hhvm/vim-hack'
Plug 'Valloric/YouCompleteMe'
Plug 'aserebryakov/vim-todo-lists'
" Plug 'dense-analysis/ale'
" Plug 'justinmk/vim-sneak'
call plug#end()

colorscheme gruvbox
set background=dark

" ALE stuff
" ***************************************************************************
" Automatic completion
" let g:ale_completion_enabled = 1
" " Include the linter name (e.g. 'hack' or 'hhast'), code, and message in errors
" let g:ale_echo_msg_format = '[%linter%]% [code]% %s'
" " Enable HHAST - this has security implications (see below)
" let g:ale_linters = { 'hack': ['hack', 'hhast'] }
" " Press `K` to view the type in the gutter
" " nnoremap <silent> K :ALEHover<CR>
" " Type `gd` to go to definition
" nnoremap <silent> gd :ALEGoToDefinition<CR>
" " Meta-click (command-click) to go to definition
" nnoremap <M-LeftMouse> <LeftMouse>:ALEGoToDefinition<CR>
" " ale formatter
" let g:ale_fixers = {
" \   'hack': ['eslint']
" \}
" let g:ale_fix_on_save = 1
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" show type on hover in a floating bubble
" if v:version >= 801
"   set balloonevalterm
"   let g:ale_set_balloons = 1
"   let balloondelay = 250
" endif
" ***************************************************************************

" ycm stuff
" set signcolumn=no
" let g:ycm_show_diagnostics_ui = 0

" netrw stuff
let g:netrw_banner = 0
let g:netrw_winsize = 75
let g:netrw_keepdir = 0
let g:netrw_altv = 1
let g:netrw_list_hide = 'Icon'

" goyo stuff
let g:goyo_width = 100
let g:goyo_height = 85

" fzf stuff
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

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

" puts pane in new tab
nnoremap <Leader>t :wincmd T<CR>

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

" YCM stuff
nnoremap <Leader>fi :YcmCompleter FixIt<CR>
nnoremap <Leader>f :YcmCompleter Format<CR>

" opens netrw side window to left
nnoremap <Leader>n :wincmd v <Bar> 
        \ :vertical resize 30 <Bar> 
        \ :Ex<CR>

" opens terminal window to left
nnoremap <Leader>t :wincmd v <Bar> 
            \ :vertical resize 60 <Bar> 
            \ :term ++curwin<CR>

" open undo tree
nnoremap <Leader>u :UndotreeToggle<CR>

" moving lines of code
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==

" moving blocks of code
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" fzf remap
nnoremap <Leader>fz :FZF<CR>

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

" colorscheme stuff
nnoremap <Leader>1 :colorscheme gruvbox<CR>:color<CR>
nnoremap <Leader>2 :colorscheme Atelier_SeasideDark<CR>:color<CR>
nnoremap <Leader>3 :colorscheme molokai<CR>:color<CR>
nnoremap <Leader>4 :colorscheme badwolf<CR>:color<CR>
nnoremap <Leader>5 :colorscheme moonshine<CR>:color<CR>
nnoremap <Leader>6 :colorscheme distinguished<CR>:color<CR>

" command remappings for common mistyping
command W write
command Q quit
command Wq write | quit
command WQ write | quit

" toggles ycm diagnostics
nnoremap <Leader>r :call ToggleDiagnostics()<CR>

" random colorscheme picker
nnoremap <Leader>` :call RandomColorschemeSetter()<CR>

" delete current colorscheme
nnoremap <Leader>~ :call DeleteCurrentColorScheme()<CR>

" press esc in terminal mode to enter 'normal mode'
tnoremap <esc> <C-W>N
tnoremap <esc><esc> <C-W>N

" toggle wrap mode
nnoremap <Leader>w :call ToggleWrapMode()<CR>

" vim-todo-lists plugin stuff
let g:VimTodoListsUndoneItem = '☐'
let g:VimTodoListsDoneItem = '✓'
let g:VimTodoListsMoveItems = 0
let g:VimTodoListsCustomKeyMapper = 'VimTodoListsCustomMappings'

nnoremap <Leader>` <C-^>

" ***************************************************************************
" ******************************** FUNCTIONS ********************************
" ***************************************************************************

function! ToggleDiagnostics()
    if g:ycm_show_diagnostics_ui == 1
        execute "set signcolumn=no | 
                    \ let g:ycm_show_diagnostics_ui=0 | 
                    \ YcmRestartServer"
        execute "e"
    else
        execute "set signcolumn=yes | 
                    \ let g:ycm_show_diagnostics_ui=1 | 
                    \ YcmRestartServer"
        execute "e"
    endif
endfunction

function! RandomColorschemeSetter()
    let currDir = getcwd()
    exec "cd /Users/jerry/.vim/plugged/vim-colorschemes/colors"
    let colorList = split(glob('*.vim'), '\n')
    let randomColor = colorList[rand() % len(colorList)][0:-5]
    try
        exec "colorscheme " . randomColor 
        exec "redraw"
        echo randomColor
    catch 
        let toDelete = randomColor . ".vim"
        exec "redraw"
        echo delete(toDelete) == 0 ? 
                    \ "SUCCESSFULLY DELETED " . toDelete
                    \ : "FAILED TO DELETE " . toDelete
    endtry
    exec "cd " . currDir
endfunction

function! DeleteCurrentColorScheme()
    let currDir = getcwd()
    exec "cd /Users/jerry/.vim/plugged/vim-colorschemes/colors"

    let defaultColorName = g:colors_name . ".vim"
    let colorNameList = split(defaultColorName, " ")
    let toDelete = join(colorNameList, "-")
    let answer = confirm("DELETE " . toDelete . " ?", "&Yes\n&No", 1)
    if answer == 1
        exec "colorscheme gruvbox"
        exec "set background=dark"
        exec "redraw"
        echo delete(toDelete) == 0 ? 
                    \ "SUCCESSFULLY DELETED " . toDelete : 
                    \ "FAILED TO DELETE " . toDelete
    else
        exec "redraw"
        echo "FAILED TO DELETE " . toDelete
    endif
    exec "cd " . currDir
endfunction

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
