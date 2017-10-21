" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Turn on syntax coloring
syntax on

" Turn on incremental searching
set incsearch

" Set the minimum window height to 0.  Meaing I'll just get a status bar if I
" switch buffers
set wmh=0

" Make the default background dark
set background=dark

" set autoindenting on
set autoindent

" use spaces instead of a tab
" set expandtab

"setup tabs to be 4 chars wide
set tabstop=4
set shiftwidth=4

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
inoremap  

" keep 50 lines of command line history
set history=50

" show the cursor position all the time
set ruler       

" display incomplete commands
set showcmd     

set numberwidth=3

set title

set laststatus=2

highlight LineNr term=bold cterm=underline,bold ctermfg=grey ctermbg=magenta



" Setup syntax highlighting for special file types
" so ~/.vim/myFileTypes.vim

" MAP FUNCTION KEYS
" ---------------------------------------------------------------------------
" <F1> Not Mapped
" =========================
" <F2> Shows line numbers
map <F2> :set invnumber<CR>
" =========================
" <F3> Loads .vimrc in window
map <F3> :sp ~/.vimrc<CR><C-W>_
" =========================
" <F4> reloads .vimrc
map <silent> <F4> :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" =========================
" <F5> Toggle showing/hiding tabs
map <silent> <F5> :call Show_tabs()<CR>
" =========================
" <F6> attempts to execute the currrent script
map <F6> :call Execute_script()<CR>
" =========================
" <F7> not mapped
" =========================
" <F8> not mapped
map <F8> :!sudo service apache2 restart<CR>
" =========================
" <F9> Paste Mode On/Off
map <silent> <F9> :call Paste_on_off()<CR>
set pastetoggle=<F9>
" =========================
" <F10> not mapped
" =========================
" <F11> not mapped
" =========================
" <F12> Create a macro to toggle when F11 is hit, this will switch the background
" from light to dark, and vice versa
map <F12> :let &background = (&background == "dark" ? "light" : "dark")<CR>
" =========================
" Done mapping keys
" ---------------------------------------------------------------------------

" ---------------------------------------------------------------------------
" Tab Stuff
map ,tn :tabnext <cr>
map ,tp :tabprevious <cr>
map ,tw :wall <cr>
map ,tq :qall <cr>
map ,tc :tabclose <cr>
map ,to :tabnew 
"
" ---------------------------------------------------------------------------
" ---------------------------------------------------------------------------
" Buffer Stuff
map ,tn :tabnext <cr>
map ,tp :tabprevious <cr>
map ,tw :wall <cr>
map ,tq :qall <cr>
map ,tc :tabclose <cr>
map ,to :tabnew 
"
" ---------------------------------------------------------------------------

func! Execute_script()
    echo 'Executing: ' @%
    :! perl % 
    return
endfunc

" ---------------------------------------------------------------------------
" Set up easy toggling for paste mode
"
let paste_mode = 0 " 0 = normal, 1 = paste
func! Paste_on_off()
        if g:paste_mode == 0
                set paste
                echo 'paste mode on'
                let g:paste_mode = 1
        else
                set nopaste
                echo 'paste mode off'
                let g:paste_mode = 0
        endif  
        return
endfunc 
"
" ---------------------------------------------------------------------------

" ---------------------------------------------------------------------------
" Toggle showing tabs or not
"
let show_tabs = 0 " 0 = no, 1 = yes 
func! Show_tabs()
    if g:show_tabs == 0
        set nolist
        echo 'Hiding Tabs'
        let g:show_tabs= 1
    else
        set list
        set listchars=tab:>-
        echo 'Showing Tabs'
        let g:show_tabs= 0
    endif  
    return
endfunc 
"
" ---------------------------------------------------------------------------


" Make the backspace work the way I want.
if &term == "xterm"
        set t_kb=
        fixdel
endif
