" pathogen setup
call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on

" makes vim behave in a more useful way (the default) than the vi-compatible manner
set nocompatible

" automatically reload files when changed on disk without prompting
set autoread

set hidden                  " can put buffer to the background without writing to disk, will remember history/marks.
set lazyredraw              " don't update the display while executing macros, speed boost
set ttyfast                 " Send more characters at a given time."

" I save all the time, those are annoying and unnecessary...
set nobackup
set nowritebackup
set noswapfile

set colorcolumn=80

set history=200 " remember more Ex commands"

" Open current buffer in a new split
noremap <leader>s <C-w>v<C-w>l
noremap <leader>i <C-w>s<C-w>j

" Buffer helpers
nnoremap <leader>l :ls<cr>:b<space>

set autowrite       " Automatically save before commands like :next and :make"

" Set encoding
set encoding=utf-8

" gui stuff
set number
set ruler

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" leader key change
let mapleader=","

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

" color setup
colorscheme Tomorrow-Night-Eighties

" Whitespace stuff
" set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" toggle absolute line numbers
let g:NumberToggleTrigger="<F2>"

" simplify split navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch

  " Custom syntax highlighting
  filetype on
  au BufNewFile,BufRead *.thor set filetype=ruby
  au BufNewFile,BufRead *.less set filetype=css
endif

" no backup directory
set nobackup
set nowritebackup

" Command-T configuration
let g:CommandTMaxHeight=20
let g:CommandTMatchWindowAtTop = 1
map <leader>tb :CommandTBuffer<cr>
map <leader>tv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>tc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>tm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>th :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>tl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>ta :CommandTFlush<cr>\|:CommandT app/assets/javascripts<cr>
map <leader>ts :CommandTFlush<cr>\|:CommandT spec<cr>

" font
" set guifont=Anonymous\ Pro:h12
set guifont=Anonymous\ Pro\ for\ Powerline:h12
let g:Powerline_symbols = 'fancy'

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$', 'tmp']
map <Leader>n :NERDTreeToggle<CR>
map <Leader>fnt :NERDTreeFind<CR>

" Tab completion and command-T filtering
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,tmp,activemq*,vendor,store-cache

" CTags
" map <Leader>cr :!ctags --languages=Ruby,JavaScript,HTML --exclude=.git --exclude=log --exclude=tmp --exclude=coverage --exclude=db --extra=+f -R *
map <Leader>cr :!ctags --exclude=.git --exclude=log --exclude=tmp --exclude=coverage --exclude=db --extra=+f -R *
map <C-\> :tnext<CR>
set iskeyword+=?,!

" Status bar
set laststatus=2

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Show (partial) command in the status line
set showcmd

" unset zsh as the shell, RVM reason?
set shell=bash

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>h :Hammer<CR>
endfunction

" add custom syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.jst set filetype=html
au BufNewFile,BufRead *[Ss]pec.js set filetype=jasmine-javascript.javascript
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
au BufRead,BufNewFile *.txt call s:setupWrapping()
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" easymotion
let g:EasyMotion_leader_key = '<Leader>m'

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

" Use Node.js for JavaScript interpretation
let $JS_CMD='node'

if &term =~ "xterm-256color"
  set t_Co=256
endif

" Center search matches when jumping
map N Nzz
map n nzz

" search highlight cancel
map <Leader><space> :nohl<cr>

" QuickFix navigation
map <C-n> :cn<CR>
map <C-p> :cp<CR>
nnoremap <LEFT> :cprev<CR>
nnoremap <RIGHT> :cnext<CR>

" Fugitive mappings
map <Leader>gb :Gblame<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gd :Gdiff<CR>
map <Leader>gl :Glog<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gp :Gpush<CR>

set completeopt+=longest,menu,preview
" only use the current file and ctags when finding keywords
set complete=.,t

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file' (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" format the entire file
nmap <leader>fef ggVG=

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

set splitbelow
set splitright

" remove scrollbar
au WinEnter * setlocal cursorline
au WinLeave * setlocal nocursorline

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the yanked stack (also, in visual mode)
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

" Map _$ to trim whitespace on the end of lines
function! Preserve(command)
  let _s=@/
  let l = line(".")
  let c = col(".")
  execute a:command
  let @/=_s
  call cursor(l, c)
endfun
nmap <silent> _$ :call Preserve("%s/\\s\\+$//e")<CR><C-l>

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

"narrower window
map - <C-W><
"wider window
map + <C-W>>
"shorter window
map _ <C-W>-
"taller window
map = <C-W>+

" keep foreground commands in sync
map fg <c-z>

" Tab indenting
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Ag settings
nnoremap <bs> :Ag! '\b<c-r><c-w>\b'<cr> " This uses ag.vim to search for the word under the cursor
map <leader>F :Ag!<space>

" leave gitgutter off by default
let g:gitgutter_enabled = 0

nnoremap <c-\> <c-w>v<c-]>zvzz " Use c-\ to do c-] but open it in a new split.

" vim tab navigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap td  :tabclose<CR>
nnoremap tn  :tabnew<CR>

" move cursor down one line even on wrapping lines
nnoremap j gj
nnoremap k gk

" save with enter
nmap <CR> :write!<CR>
cabbrev w nope

" set clipboard^=unnamed
" if $TMUX == ''
"   " set clipboard=unnamed
"   set clipboard=unnamedplus
"   " set clipboard+=unnamed
" endif

" Don't clobber the unnamed register when pasting over text in visual mode.
" vnoremap p pgvy

":autocmd FileType mail :nmap <F8> :w<CR>:!aspell -e -c %<CR>:e<CR>

" autocmd VimEnter,BufNewFile,BufReadPost * call HardMode()
nnoremap <leader>h <Esc>:call EasyMode()<CR>
nnoremap <leader>H <Esc>:call HardMode()<CR>

let g:no_turbux_mappings = 1
map <leader>rt <Plug>SendTestToTmux
map <leader>rT <Plug>SendFocusedTestToTmux
