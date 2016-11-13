let mapleader = ","             " Our free key to prefix custom commands
let localleader = "\\"
set hidden                      " switch buffers w/o saving
set shell=/bin/sh

set clipboard=unnamed			" Use the global, system clipboard



" Settings for moving between windows. 
" Here mostly for Nvim-r
    nnoremap <silent> <S-Up> :wincmd k<CR>
    nnoremap <silent> <S-Down> :wincmd j<CR>
    nnoremap <silent> <S-Left> :wincmd h<CR>
    nnoremap <silent> <S-Right> :wincmd l<CR>
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif

tnoremap <leader><ESC> <C-\><C-n>
tnoremap <PageUp>   <C-\><C-w>H
tnoremap <PageDown> <C-\><C-w>J

tnoremap <M-h> <C-\><C-n><C-w>h
tnoremap <M-j> <C-\><C-n><C-w>j
tnoremap <M-k> <C-\><C-n><C-w>k
tnoremap <M-l> <C-\><C-n><C-w>l
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>

" tnoremap <C-h> <C-\><C-n><C-h>
" tnoremap <C-j> <C-\><C-n><C-j>
" tnoremap <C-k> <C-\><C-n><C-k>
" tnoremap <C-l> <C-\><C-n><C-l>

highlight TermCursor ctermfg=red 			" make :terminal cursor red
highlight Search term=bold ctermbg=225 guibg=LightMagenta


" Older settings below
""""""""""""""""""""""

" General g
    set nobackup                    " don't let vim backup files
    set noswapfile
    set nowritebackup               " And again.
    set autochdir                   " always switch to current dir
    set backupdir=~/.vim/backup
    set wildmode=list:longest       " Complete files like a shell.
    set modeline
    set noerrorbells                " No beeping!
    set visualbell                  " No flashing either.
    set wildignore+=*.jpg,*.gif,*.png,*.git,*.gem,*.zip,*.tar.gz
    set wildignore+=node_modules

    " After searching with /, hitting <leader>/ toggles highlight
    nnoremap <silent> <leader>/ :set hlsearch! hlsearch?<CR>
" 

" UI g
    let loaded_matchparen = 1       " Just use % instead of auto paren matching
    " set colorcolumn=80            " vertical line at 80 cols
    set nostartofline               " Searches leave cursor on same column
    set ignorecase                  " Case-insensitive searching.
    set lazyredraw                  " No redraw during macro execution
    set number                      " Show line numbers.
    set shortmess=atI               " stifle the long interrupt prompts
    set showmode                    " Display the mode you're in.
    set smartcase                   " But case-sensitive if has caps
    set scrolloff=3                 " Show 3 lines around cursor (more context)
    set noshowmode                  " hide the default mode text (e.g. -- INSERT --)
    set title                       " Set the terminal's title

    " Open new split panes to the right and bottom, which feels more natural
    set splitbelow
    set splitright
" 


" Indenting and tabs g
    set smartindent         " be smart about it
    set nowrap              " do not wrap lines please
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4        " no clue what this does
    set shiftround          " if spaces, TAB maps to right spot

    " set fo+=c             " Auto-wrap comments, inserting comment leader
    " set fo+=t               " Auto-wrap text using textwidth
    " set fo-=r               " Do not auto insert a comment leader after <Enter>
    " set fo-=n

    " Change tabs to spaces, or the other way around. Good for Python!
    nmap <leader>1 :set et<cr>:retab<cr>
    nmap <leader>2 :set noet<cr>:retab!<cr>
    " remove trailing spaces

    set pastetoggle=<F2>            " --INSERT (paste)-- means safe for formatted text

    nnoremap <leader>o :set paste<CR>:put *<CR>:set nopaste<CR>
" 


" Buffer Management g

    " I never really used buffers so I removed these commands
    " nnoremap L :bnext<CR>
    " nnoremap H :bprev<CR>

    nnoremap <silent> <S-Up> :wincmd k<CR>
    nnoremap <silent> <S-Down> :wincmd j<CR>
    nnoremap <silent> <S-Left> :wincmd h<CR>
    nnoremap <silent> <S-Right> :wincmd l<CR>

" 

" Mapping g
    " Make it easier to (make it easier to (make it easier to (edit text)))
    nnoremap <leader>vi :split $MYVIMRC<cr>
    nnoremap <leader>vs :source $MYVIMRC<cr>

    " Two quick jk exits insert mode (odd, I know)
    inoremap jk <Esc>

    " Q for formatting paragraph or selection
    vnoremap Q gq
    nnoremap Q gqap

    " Sane navigation for wrapped lines
    nnoremap j gj
    nnoremap k gk

    " Use capital H/L for first/last non-whitespace character on line
    noremap H ^
    noremap L g_

    " Select current line, excluding indents (great for copying to clipboard)
    nnoremap vv ^vg_

    " Disable K from looking stuff up
    noremap K <Esc>

    " ideas taken from Janus
    " toggle line wrapping modes
    nnoremap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

    :cnoremap Wq wq

    " <leader>r to open HTML file in browser  http://goo.gl/yJtG4
    au FileType html map <buffer> <leader>r :silent! ! open -g %<cr>:redraw!<cr>
    au FileType html map <buffer> <leader>R :silent! ! osascript -e 'tell app "Google Chrome" to tell the active tab of the first window to reload'<cr>:redraw!<cr>

    " Open current Markdown (*.md) file in OS X "Marked" and force redraw
    nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr> :redraw!<cr>
    " nnoremap <leader>m :silent !open -a MacDown.app '%:p'<cr> :redraw!<cr>

"    nnoremap <leader>r gq}               " *r*eformat current paragraph

    " Show cursor column marker
    nnoremap <leader>c :set cursorcolumn!<CR>
    nnoremap <leader>l :set cursorline!<CR>
    hi CursorLine ctermbg=yellow ctermfg=white cterm=none

    " Abbreviations From http://vimcasts.org/episodes/show-invisibles/
    ab [heart] ❤
    ab [cmd] ⌘
    ab [shift] ⇧
    ab [option] ⌥
    ab [ctrl] ⌃
    ab [tab] ⇥
    ab [section] §
    ab [lozenge] ◊
    ab [interpunct] ·
    ab [reference] ※
    ab [ellipse] …     
    ab [bar] ―
    ab [left] ←
    ab [right] →
    ab [pi] π
	ab [shrug]  ¯\_(ツ)_/¯

    " Toggle invisible whiteSpace ¬ ¶
    nnoremap <leader>i :set list!<CR>
    set listchars=""            " reset listchars
    set listchars+=eol:¬
    set listchars+=tab:▸\.
    set listchars+=nbsp:_
    set listchars+=extends:»
    set listchars+=precedes:«
    set listchars+=trail:▫
    " set listchars=eol:¬,tab:⧂⇥⇥»,trail:▫,nbsp:_

    " Runs the current line in the shell. Very dangerous.
    " nnoremap <leader>; :.w !sh<CR>

    " <leader>s is easier than :w<CR>
    nnoremap <leader>w :w<CR>
    nnoremap <C-s> :w<CR>

    " Capital Y copies to the EOL
    nnoremap <S-y> y$

    " select all text in current buffer (like Command-A)
    noremap <leader>a ggVG

    nnoremap <C-j> <C-d>
    nnoremap <C-k> <C-u>
    vnoremap <C-j> <C-d>
    vnoremap <C-k> <C-u>
    nnoremap <space> <C-d>
    nnoremap <C-space> <C-u>

    nnoremap <leader>b <C-w>l

    " Flip between last two files
    nnoremap <leader><leader> <c-^>

    " Indent and outdent now > and < keep the visual selection
    vnoremap > >gv
    vnoremap < <gv
    vnoremap <Tab> >gv
    vnoremap <S-Tab> <gv

    " Make Control-T uppercase the current word 
    inoremap <C-t> <ESC>bgUWea

    " Add the . command to visual mode
    vnoremap . :norm.<CR>

    " Auto-complete for keywords
    " imap <Tab> <C-N>
    inoremap <S-Tab> <C-P>

    " Execute buffer in Python
    " nnoremap <leader>p :w<CR>:!driver.sh <CR>
    nnoremap <leader>p :w<CR>:!python3 % --test <CR>
    " nnoremap <leader>p :w<CR>:!/usr/bin/env awk -f % data.csv <CR>
    " nnoremap <leader>p :w<CR>:!/usr/bin/env node % <CR>
" 

" Skeleton files with todo templates g
"use .vim/skel/template.html template for editing new files that match *.html
" au! BufNewFile * silent! 0r ~/.vim/skel/template.%:e

au! BufNewFile * call LoadTemplate()
function! LoadTemplate()
        silent! 0r ~/.vim/skel/template.%:e
        " Highlight %VAR% placeholders with the Todo colour group
        syn match Todo "%\u\+%" containedIn=ALL
endfunction
" Jump between %VAR% placeholders in Insert mode with <Ctrl-p>
inoremap <c-p> <ESC>/%\u.\{-1,}%<cr>c/%/
nnoremap <c-p> /%\u.\{-1,}%<cr>c/%/e<cr>
" 

" Filetypes g
" Automatically insert line breaks in text files
" au BufEnter *.txt setl tx fo+=n2a linebreak

" au BufNewFile,BufRead *.jade set filetype=jade
" 

" Tabbed Windows g
    nnoremap + :tabnew<CR>
    nnoremap <Tab> :tabn<CR>
    nnoremap <S-Tab> :tabp<CR>

    noremap <leader>tt :tabnew<cr>
    noremap <leader>te :tabedit
    noremap <leader>tc :tabclose<cr>
    noremap <leader>to :tabonly<cr>
    noremap <leader>tn :tabnext<cr>
    noremap <leader>tp :tabprevious<cr>
    noremap <leader>tf :tabfirst<cr>
    noremap <leader>tl :tablast<cr>
    noremap <leader>tm :tabmove
" 

" Plugins g
    " Follow install directions here:
    " https://github.com/junegunn/vim-plug
    "
    " if empty(glob('~/.vim/autoload/plug.vim'))
    "   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    "       \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "   autocmd VimEnter * PlugInstall | source $MYVIMRC
    " endif

    call plug#begin()

	Plug 'tpope/vim-sensible'

	Plug 'kassio/neoterm'

	" Python
	Plug 'neomake/neomake'
	let g:neomake_python_enabled_makers = ['flake8', 'pep8', 'vulture']
	let g:neomake_python_flake8_maker = { 'args': ['--ignore=E302,E501'], }
	autocmd! BufWritePost * Neomake

	" For R language
	Plug 'jalvesaq/Nvim-r',   { 'for': 'r' }
	Plug 'jalvesaq/colorout', { 'for': 'r' }
	vmap <Space> <Plug>RDSendSelection
	nmap <Space> <Plug>RDSendLine
	let R_assign = 0
	let R_vsplit = 1
	let R_args = ['--no-save']
	" I needed to run `brew link --force readline` in order to get gcc5
	" to compile nvimcom (which updates automatically when you invoke nvim-r)

    Plug 'kshenoy/vim-signature'                    " show marks in margin
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-commentary'                     " smarter commenting with gc
    Plug 'altercation/vim-colors-solarized'
    Plug 'matchit.zip'                              " smarter % key matching

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    let g:airline_powerline_fonts = 1

    " Evaluate for future install
    " Plug 'zaiste/tmux.vim'                    " syntax for tmux?
    " Plug 'airblade/vim-gitgutter'             " shows git diff marks in the gutter
    " Plug 'nathanaelkane/vim-indent-guides'    " toggle visual indent guides
    "    nmap <silent> <leader>g <Plug>IndentGuidesToggle
    " Plug 'jistr/vim-nerdtree-tabs'
    "    nnoremap <leader>u <plug>NERDTreeTabsToggle<cr>
    " Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    "    nnoremap <leader>nt :NERDTree<cr>
    " Plug 'mattn/emmet-vim'                    " ctrl+e expands html tags
    "     let g:user_emmet_leader_key = '<c-e>'
    " Plug 'vim-scripts/dbext.vim' { 'for': 'sql' }

    " Syntax extensions
    " Plug 'groenewege/vim-less'
    " Plug 'digitaltoad/vim-jade'
    " Plug 'wavded/vim-stylus'
    " Plug 'kchmck/vim-coffee-script'
    " Plug 'tpope/vim-markdown'
    
    call plug#end()

" 

" Use the Silver Searcher https://github.com/ggreer/the_silver_server
" requires: brew install ag
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Colors (solarized) g
    " let g:solarized_contrast="high"     
    " let g:solarized_visibility="high"
    " call togglebg#map("<leader>x")          " ,x toggles dark/light

    " let profile = $ITERM_PROFILE
    " if profile ==? 'solarized-dark'
    "     set background=dark                 " light | dark
    "     hi colorcolumn ctermbg=darkgrey
    " else
    "     set background=light
    "     hi colorcolumn ctermbg=lightgrey
    " endif
    " colorscheme solarized
    " "  Remove next line comment to force dark color scheme.
    " "  Usually it's picked because iTerm2 will pass it in.
    " " setenv ITERM_PROFILE solarized-dark
" 

" Auto Commands autocmds g

let g:dbext_default_profile_sqlite = 'type=SQLITE:dbname=cc3.db'
augroup sql
    au!
    autocmd BufRead *.sql DBSetOption profile=sqlite
augroup end


" Wrapping autocmd in a group per http://bit.ly/15wKRrM
augroup my_au
    autocmd!
    au FileType python setlocal expandtab ts=2 sw=2 sts=2
    au FileType ruby setlocal ts=2 sw=2 sts=2
    au FileType make setlocal noexpandtab

    " place this after plugins have loaded
    " Set textwidth like a boss http://blog.ezyang.com/2010/03/vim-textwidth/
    au FileType text,markdown setlocal textwidth=72 colorcolumn=80
    au FileType stylus,jade set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab
    au FileType javascript set ts=4|set shiftwidth=4|set expandtab
    au FileType coffee setlocal ts=2 shiftwidth=2 shiftwidth=2 expandtab
    au Filetype drake set ts=2 softtabstop=2 shiftwidth=2 expandtab
    au FileType r set ts=2 softtabstop=2 shiftwidth=2 expandtab

    au BufEnter *.tsv set tabstop=14 softtabstop=14 shiftwidth=14 noexpandtab

    " % npm install node-jslint -g
"   augroup FileType javascript
"       set makeprg=jshint\ %
"       set errorformat=l:%c,%Z\\s%#Reason: %m,%C%.%#,%f: line %l\, col %c\, %m,%-G%.%#
"   augroup end
"
    " Jump to the last position of the cursor except for git commits
    function! PositionCursorFromViminfo()
        if !(bufname("%") =~ '\(COMMIT_EDITMSG\)') && line("'\"") > 1 && line("'\"") <= line("$")
            exe "normal! g`\""
        endif
    endfunction
    au BufReadPost * call PositionCursorFromViminfo()

    " Jump to the last position of the cursor
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

    " Turn off line wrapping when working on HTML files
    au BufNewFile,BufRead *.html setlocal nowrap
augroup END
"


function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre *.py :call TrimWhiteSpace()
autocmd BufWritePre *.R :call TrimWhiteSpace()

nnoremap <leader>$ :silent call TrimWhiteSpace()<CR>

" Hit F4 when editing a Javascript file will write, run jslint and show
" you errors. Requires ftplugin/javascript.vim to be setup according to
" http://technotales.wordpress.com/2011/05/21/node-jslint-and-vim/

nnoremap <F4> :w<CR>:make<CR>:cw<CR>
" highlight SpecialKey term=bold cterm=bold     " use reverse if bold isn't enough

" Go into WordProcessorMode when typing Markdown paragraphs: <leader>0
" http://www.drbunsen.org/writing-in-vim/
func! WordProcessorMode()
    setlocal formatoptions=1t
    setlocal noexpandtab
    map j gj
    map k gk
    setlocal spell spelllang=en_us
    set complete+=s
    set formatprg=par
    setlocal wrap
    setlocal linebreak
endfu
nnoremap <leader>0 :silent call WordProcessorMode()

if has('persistent_undo')
    set undofile "Enable persistent undo

    " Set persistent undo directory
    set undodir=~/.vim/undo
    if !isdirectory(expand(&undodir))
        call mkdir(expand(&undodir), 'p')
    endif
endif

" Run "formd" command on buffer to fix Markdown hyperlinks
" This script assumes formd is in your path at:
" ~/bin/formd/formd
" http://drbunsen.github.com/formd/
 
function! Formd(option)
    :let save_view = winsaveview()
    :let flag = a:option
    :if flag == "-r"
        :%! ~/bin/formd -r
    :elseif flag == "-i"
        :%! ~/bin/formd -i
    :else
        :%! ~/bin/formd -f
    :endif
    :call winrestview(save_view)
endfunction
 
nmap <leader>fr :call Formd("-r")<CR>
nmap <leader>fi :call Formd("-i")<CR>
nmap <leader>f :call Formd("-f")<CR>

" Set cursor to underscore in insertmode 

if $TERM_PROGRAM =~ "iTerm.app"
    let &t_SI = "\<Esc>]50;CursorShape=2\x7" " 1 = vertical bar; 2 = underscore
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" Ctrl+S should save in normal and input mode
noremap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
imap <c-s> <Esc><c-s>

"R Script settings
vmap <space> <Plug>RDSendSelection
nmap <space> <Plug>RDSendLine
let vimrplugin_applescript=0
let vimrplugin_vsplit=1

highlight Search term=bold ctermbg=225 guibg=LightMagenta

" au BufEnter,BufRead *.py set ai sw=2 ts=2 sts=2 sta et fo=croql

" PEP8 has defined the proper indentation for Python
au BufNewFile,BufRead *.py set ts=4 sts=4 sw=4 tw=79 expandtab fileformat=unix


" Neoterm settings
nnoremap <silent> ,yd :call neoterm#close()<cr>
nnoremap <silent> ,yl :call neoterm#clear()<cr>
nnoremap <silent> ,yc :call neoterm#kill()<cr>

" iTerm2 send control-enter <C-Enter> so I have it's profile
" send the Maltese cross instead. 
" https://stackoverflow.com/questions/5388562/cant-map-s-cr-in-vim
nnoremap <silent> ✠ :TREPLSendLine<cr>j
inoremap <silent> ✠ <ESC>:TREPLSendLine<cr>A
vnoremap <silent> ✠ :TREPLSendSelection<cr>gv

" Easily get out of Terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <Esc><Esc> <C-\><C-n><C-w>k

" Some tips for making relative line numbers good in VIM
" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
"au InsertEnter * :set norelativenumber
"au InsertLeave * :set relativenumber

