"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                  " enable syntax highlight (syntax off)
set background=dark        " looks good with the syntax enabled
"colorscheme elflord        " default coloration theme
"colorscheme torte
" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermbg=0 ctermfg=red
  au InsertLeave * hi StatusLine ctermbg=black ctermfg=white
endif

" enable line numeration (set nonumber)
set number

" enable shift insert from system clipboar
" set clipboard=unamed

" enable the case insensitive search (set ic/set noic)
set ignorecase

" don't start the search from the beginning when the end of file is reached
set nowrapscan

" put the cursor to the matching string while typing
set incsearch

" search case sensitive if any upper case character appeared in the search string
set smartcase

" highlight current line (set nocursorline)
set cursorline

" highlight all search matches (set hls)
set hlsearch

" avoid copy buffer size limitation (50 lines)
" reject vi compatibility
set nocompatible

" keep the indentation level you are currently at when you hit the enter key
set autoindent

" show pair brackets/parenthesis
set showmatch

" show commands made in the command mode (helpful for the selection)
set showcmd

" blink when the bottom/top of any file is reached
" set visualbell

" to display characters which cannot be fit into 1 byte
set encoding=utf-8

" set the maximum number of tabs which can be opened
set tabpagemax=30

" show top tab line: 2 - always, 1 - only if multiple tabs
set showtabline=2

" history of typed entries
set history=300

" set soft tab mode (insert whitespaces instead of tab special character)
set expandtab

" set tab indent (hard tab: ^I is displayed as <number> empty spaces, soft tab: number of white spaces to be inserted at each tab press)
set tabstop=4

" set shift indent used by << == >> commands
set shiftwidth=4

" this makes the backspace key treat the 4 spaces like a tab
set softtabstop=4

" this make '>' and '<' commands to round the shift spaces to the closest shiftwidth
set shiftround

" don't spread long lines among multiple lines but scroll the screen instead
set nowrap

" set the tag file produced by ctags (;/ - to search up in the directory hierarchy in case it's not found)
set tags=~/develop/br_5-1

" don't timeout when mapping or key codes are typed (don't wait when ESC is typed)
set timeoutlen=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files/Backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backup " make backup file
set backupdir=~/.vimswp/backup/ " where to put backup file
set directory=~/.vimswp/temp " directory is the directory for temp file

set ruler

highlight User2 ctermfg=green ctermbg=black
" status line
" f - file name
" F - full file name
" L - number of lines
" Y - file type
" n - number of the buffer
" r - [RO] if readonly
" b - number of the character under the cursor
" l - line number
" c - column number
" p - percentage
" <num>* - set the hightgroup User<num>
set statusline=[tab=%n]\ %2*%F%*\ [lines=%L]\ [type=%Y]\ %r\ [%l,%c:%p%%]\ [ascii=%b,%B]

" always display the status line
set laststatus=2

" disable autoindent when copying from the clipboard (middle click), set nopaste to revert the change (cannot be enable by default because disables autoindent)
" set paste

" asks for confirmation (save or not), asks only once, so, not that annoying
" set confirm

" make unsaved buffer hidden instead of asking to put !
set hidden

" saves automatically unsaved buffers at switch time (hidden looks safer)
" set autowrite

" abbreviations
iab teh the
iab marco macro
iab inerface interface

" use mouse to scroll, switch between tabs, close tabs, select text (set mouse-=a)
" set mouse=a

" tab completion for the new files
" set wildmenu

" ':' or '/' and Ctrl+f - history
" Ctrl+c+c exit history

" force the specific file type
" C++ : cpp
" SQL : sql
" SHELL : sh
" setf <language>

" source config file
" source <config>

" <CR> 	- keystroke ENTER
" <ESC> - keystroke ESC
" <s-> 	- keystroke SHIFT+
" <c-> 	- keystroke CTRL+
" <LeftMouse> <RightMouse> <MiddleMouse> <LeftRelease> <RightRelease> <MiddleRelease>
" map tab switch shortcuts in normal mode (nmap)
nmap <F2> :tabnext<CR>
nmap <F1> :tabprevious<CR>
nmap <F6> :NERDTreeToggle<CR>
nmap <F7> :TagbarToggle<CR>
nmap <c-h> :set invhlsearch<CR>  " <CTRL -h> Invalidete the search
nmap <c-n> :set invnumber<CR>    " <CTRL -h> emove numbers
nmap <c-p> :set invspell<CR>     " <CTRL -h> nable spelling
nmap <c-l> :set invlist<CR>      " <CTRL -h>  at the end of the line

" toggle paste option on/off (if on - pasting is made with indents)
set pastetoggle=<F12>

" highligh command: hi[ghlight] <group> <options>
" options: ctermbg - backgroud, ctermfg - foregrouond (text), cterm = [bold|italic|underline|reverse]
" highlight TrcErrGrp ctermfg=red
" highlight TrcInfoGrp ctermfg=cyan
" highlight TrcNotGrp ctermfg=green
" highlight Comment ctermfg=blue
" default groups: ErrorMsg

" set match for the tracer logs
" match none, 2match none, 3match none to remove all the matches
match ErrorMsg /\<\(ERROR\|WARN\|CRIT\|FATAL\)\>.*$\C/
2match Todo /\s\+$/

" hightlight the current line
highlight clear CursorLine
highlight CursorLine ctermbg=blue

" :tabnew <> - open a file in a new tab
" :tabn[ext] - move to next tab
" :tabp[revious] - move to previous tab
" :tabfirst - move to the first tab
" :tablast - move to the last tab
" :tabm[ove] <number> - move to the tab <number> (starts from 0)
" :tabdo <command> - do a command on all the tabs
" \c - case insensitiv search (at the end of the search pattern)
" \C - case sensitive search (at the end of the search pattern)
" :version - version of the vim
" :intro - show the intro
" :changes - ???
" Ctrl+a - increment a number under the cursor
" Ctrl+x - decrement a number under the cursor
" Ctrl+g - show the file name + number of lines in it
" ^ - to the first non blank character
" g_ - to the last non blank character
" :ls - see all the buffers (%a - active, # - the next buffer, h - hidden buffer, it has unsaved changes)
" Ctrl+^ - to switch between the active and the next buffers
" :bn - next buffer
" :bp - buffer previous
" :bn! - skip the warning about unsaved changes, creates a hidden buffer
" :b<num> - go to the buffer <num>
" Ctrl+] - go to the tag
" Ctrl+w+] - open a tag in a new window (horizontal split)
" Ctrl+t - go back in the tag stack
" :tags - see the tag stack
" :ts[elect] <tag> - see all the tags with the given name
" %s/0/\r/g - replace all 0 with the new line character
" Ctrl+r + Ctrl+w - paste yanked text into command line
" z= - suggest correctly spelled words for the word under the cursor
" zg - add the word under the cursor to the spellfile
" ]s - go to next misspelled word
" [s - go to previous misspelled word
" :reg - see past registers
" "ayy - copy whole line into register 'a'
" "ap - paste from register 'a'

" insert and commandline modes too.
map  <C-A> <Home>
map  <C-E> <End>
map! <C-A> <Home>
map! <C-E> <End>

" P L U G I N   C O N F I G U R A T I O N
" Pathogen
execute pathogen#infect()

" CtrlP configuration
set runtimepath^=~/.vim/bundle/ctrlp.vim
