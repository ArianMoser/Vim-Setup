source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin




"Indentation options"
set autoindent "New lines inherit the indentation of previous line"
set expandtab "Convert tabs to spaces"
"set filetype indent on Enable type specific indentation rules"
set shiftround "When shifting lines, round the indentation to the nearest multiple of shiftwidth."
set shiftwidth=4 "When shifting, indent using four spaces"
"set tabstop=4 Indent using four spaces
"set smarttab: Insert tabstop number of spaces when the tab is pressed"

"Search options"
set hlsearch "Enable search highlighting"
set ignorecase "Ignore case when searching" 
set incsearch "Incremental search that shows partial matches."
set smartcase "Switch to case-sensitive if an uppercase letter is used"

"Performance options"
set complete-=20 "Limits the files searched for autocomplete
set lazyredraw "Dont update screen during macro and scipt execution

"Text Rendering options"
set display+=lastline "Always try to show last line of a paragraph"
set encoding=utf-8 "Use an unicode supporting encoding"
set linebreak "Avoid wrapping a line in the middle of the word"
set scrolloff=1 "Number of lines to keep up and down of the cursor"
set sidescrolloff=5 "The number of screen line to keep to the left and right of the cursor"
syntax enable "Turn on syntax highlighting
set wrap "Enable wraping"

"User Interface options"
set laststatus=2 "Always display status bar"
set ruler "Always show cursor position"
set wildmenu "Display command lines tab complete options as a menu"
set tabpagemax=20 "Max number of tab pages that can be opened from the cmd line"
"set colorscheme wombat256mod Change color scheme"
set cursorline "Highlight the line currently under cursor"
set number "enable line numbers
set relativenumber "Show line number relative to current line"
set noerrorbells "Disable beep on error"
set visualbell "Flash screen insted of beeping on errors"
set mouse=a "Enable mouse for scrolling and resizing"
set title "Set the windows title, reflecting the current file"
set background=dark "Use colors that suit a dark background"

"Code Folding options"


"Miscellaneous options"
set autoread "Automatically re-read files if unmodified inside Vim."
set backspace=indent,eol,start "Allow backspacing over indention, line breaks and insertion start."
set backupdir=%HOME%\.cache\vim "Directory to store backup files."
set confirm "Display a confirmation dialog when closing an unsaved file."
set dir=%HOME%\.cache\vim "Directory to store swap files."
set formatoptions+=j "Delete comment characters when joining lines."
set hidden "Hide files in the background instead of closing them."
set history=1000 "Increase the undo limit."
set nrformats-=octal "Interpret octal as decimal when incrementing numbers."
"set shell "The shell used to execute commands.
"set spell: "Enable spellchecking."
set wildignore+=.pyc,.swp "Ignore files matching these patterns when opening files based on a glob pattern."
set noswapfile "Disable swap files"


"Load plugins"
silent! call plug#begin('C:\Program Files (x86)\Vim\plugged')

" vim-snippet
Plug 'https://github.com/honza/vim-snippets.git'

" Init plugin system
call plug#end()


" Map Keys"

" GoLang"
let mapleader=","
au FileType go nmap <leader>r :update <CR> :execute "! cls && go run " . @% <CR>
au FileType go nmap <leader>i :update <CR> :execute "! cls && go install " . @% <CR>
au FileType go nmap <leader>b :update <CR> :execute "! cls && go build " . @% <CR>
au FileType go nmap <leader>f :update <CR> :execute "! gofmt -w" . @% <CR>

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

