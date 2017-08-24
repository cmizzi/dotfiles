" Plugins loader {{{
" vim-plug (https://github.com/junegunn/vim-plug) settings {{{
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin("~/.vim/plugged")

Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'bling/vim-airline'
Plug 'benekastah/neomake'
Plug 'junegunn/vim-easy-align'
Plug 'msanders/snipmate.vim'
Plug 'tobyS/pdv' | Plug 'tobyS/vmustache' | Plug 'SirVer/ultisnips'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'mattn/emmet-vim'
Plug 'https://github.com/joonty/vdebug'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'jwalton512/vim-blade'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-completion-manager'
Plug 'Shougo/echodoc.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'isRuslan/vim-es6'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'elzr/vim-json'
Plug 'pearofducks/ansible-vim'
Plug 'tpope/vim-repeat'
Plug 'chrisbra/csv.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'sickill/vim-pasta'
Plug 'tmhedberg/matchit'
Plug 'evidens/vim-twig'
Plug 'smerrill/vcl-vim-plugin'
Plug 'kovetskiy/sxhkd-vim'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'stephenway/postcss.vim'
Plug 'posva/vim-vue'
Plug 'robbles/logstash.vim'
Plug 'StanAngeloff/php.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'mbbill/undotree'
Plug 'kshenoy/vim-signature'
Plug 'leafgarland/typescript-vim'
Plug 'vim-scripts/colorizer'
Plug 'matze/vim-move'
Plug 'https://github.com/vimgineers/vim-hugefile'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/FuzzyFinder'
Plug 'kana/vim-textobj-user'
Plug 'lucapette/vim-textobj-underscore'
Plug 'jceb/vim-textobj-uri'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'sts10/vim-zipper'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'

call plug#end()
" }}}
" General {{{

let mapleader = ","

filetype plugin indent on
filetype off
syntax on

set ru
set number
set relativenumber
set lazyredraw
set shiftround
set nrformats=
set autoread
set laststatus=2
set showcmd
set hidden
set cmdheight=1
set noshowmode
set mousehide
set mouse=a
set cursorline
set hlsearch
set incsearch
set ignorecase
set smartcase
set autochdir
set wildmenu
set showmatch
set modelines=5
set modeline

set clipboard-=unnamed
set virtualedit=block

set scrolloff=5
set sidescrolloff=7
set sidescroll=1

set foldenable
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10

set inccommand=split
set splitbelow
set splitright
set list
set listchars=tab:+\ ,eol:-

set nostartofline
set rtp+=~/.fzf
" }}}
" Swap, undos and backup {{{
set undofile
set undolevels=1000
set undoreload=10000
set backup
set backupskip=/tmp/*,/private/tmp/*
set backupdir=~/tmp/nvim,~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=/tmp/nvim,~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set undodir=/tmp/nvim,~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" Indentation {{{
set ts=4
set sw=4
set autoindent
set smartindent
" }}}
" Format {{{
set cc=+1
set tw=80
set formatoptions-=t
set formatoptions+=j
set formatoptions-=o
" }}}
" Keymaps {{{
cnoremap <c-A> <Home>
cnoremap <c-E> <End>
cnoremap <c-K> <C-U>
vmap <leader>c :call system("xclip -i -selection clipboard", getreg("\""))<CR>
vnoremap > ><CR>gv
vnoremap < <<CR>gv
nnoremap <leader>t :%s/\s\+$//e<CR>:nohls<Cr>
nnoremap <leader><CR> :nohls<CR>
nnoremap <leader>bd :Bclose!<CR>
nnoremap <leader>gc :silent !git-cola > /dev/null 2>&1&<CR> :redraw!<CR>
cmap w!! w !sudo tee > /dev/null %
vmap <Enter> <Plug>(EasyAlign)
vmap <c-Up> <Plug>MoveBlockUp
vmap <c-Down> <Plug>MoveBlockDown
nnoremap <silent> <leader>o :<C-u>Denite buffer file_mru `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>

nmap <bar> <Plug>ZipClosed
vmap <bar> <Plug>ZipClosedVisual

nmap <Bslash> <Plug>ZipOpenNext
nmap <C-Bslash> <Plug>ZipOpenPrev
vmap <Bslash> <Plug>ZipOpenVisual

" use leader to interact with the system clipboard
nnoremap <Leader>p "*]p
nnoremap <Leader>P "*]P
nnoremap <Leader>y :y*<cr>
nnoremap <Leader>c ^"*c$
nnoremap <Leader>d ^"*d$
vnoremap <Leader>y "*y
vnoremap <Leader>c "*c
vnoremap <Leader>d "*d

nmap X "_d
nmap XX "_dd
vmap X "_d
vmap x "_d

" have x (remves single character) not go into the default registry
nnoremap x "_x
nnoremap c "_c
vnoremap c "_c

cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>

" Make the dot command work as expected in visual mode (via
" https://www.reddit.com/r/vim/comments/3y2mgt/do_you_have_any_minor_customizationsmappings_that/cya0x04)
vnoremap . :norm.<CR>

" Allows you to visually select a section and then hit @ to run a macro on all
" lines
" https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db#.3dcn9prw6
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
" }}}
" Plugins configuration {{{
autocmd FileType python setlocal foldmethod=syntax
autocmd FileType vim setlocal foldmethod=marker
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:neomake_php_lsi_maker = {
			\ 'exe': 'phpmd',
			\ 'args': ['%:p', 'text', '/data/gedeon/config/phpmd.xml'],
			\ 'errorformat': '%E%f:%l%\s%m'
			\ }

let g:neomake_php_enabled_makers = ['php', 'lsi']
let g:neomake_typescript_enabled_makers = []
let g:neomake_open_list = 2
let g:neomake_airline = 1
autocmd! BufWritePost * Neomake

fun! LoadSnippets(p, ft)
	call ResetSnippets(a:ft)

	" Always include global snippets
	let snips = split('_,'.a:p, ',')
	for name in snips
		" Extract the file from the snippet plugin dir and also from my custom
		" snippets directory

		call ExtractSnipsFile(g:snippets_dir . name . '.snippets', a:ft)
		call ExtractSnipsFile("/home/cyril/.vim/snippets/" . name . '.snippets', a:ft)
	endfor
endfun

" Command to load snippets files for current filetype
com! -nargs=1 Snip call LoadSnippets(<f-args>, &ft)
autocmd BufReadPre,FileReadPre * :call LoadSnippets(&ft, &ft)

let g:vim_php_refactoring_phpdoc = 'pdv#DocumentWithSnip()'
let g:deoplete#enable_at_startup = 1
set shortmess+=c

let g:vdebug_options = {"path_maps": {"/var/www": "/data"}, "break_on_open": 1, "watch_window_style": "compact", "port": "9001" }

let g:pdv_template_dir = $HOME . "/.vim/snippets/pdv"
nnoremap <leader>doc :call pdv#DocumentWithSnip()<CR>
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction

autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap  <Leader>e :call PhpExpandClass()<CR>
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap  <Leader>u :call PhpInsertUse()<CR>
autocmd FileType php inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap  <Leader>s :call PhpSortUse()<CR>

let g:php_namespace_sort_after_insert = 1
let g:colorizer_nomap = 1
let g:hugefile_trigger_size=10

:auto InsertEnter * :setlocal isk+=-
:auto InsertLeave * :setlocal isk-=-
set completeopt=menu

call denite#custom#source('file_mru', 'matchers', ['matcher_regexp'])
call denite#custom#source('file_rec', 'matchers', ['matcher_regexp'])
call denite#custom#source('buffer', 'matchers', ['matcher_regexp'])
call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])
call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<Up>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-Right>', '<denite:jump_to_next_source>', 'noremap')
call denite#custom#map('insert', '<C-Left>', '<denite:jump_to_previous_source>', 'noremap')
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

function! ExecuteMacroOverVisualRange()
	echo "@".getcmdline()
	execute ":'<,'>normal @".nr2char(getchar())
endfunction
" }}}
" Theme {{{
set t_Co=256
set background=dark
colorscheme gruvbox
" }}}
" Functions and groups {{{
aug QFClose
	au!
	au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" http://www.vim-fr.org/index.php/Urxvt

if !has("gui_running")
	" À défaut de pouvoir changer la forme du curseur
	" en fonction du mode de Vim, on peut changer sa couleur
	" en passant par des fonctions de contrôle.
	if &term =~ "rxvt-unicode"
		" From ECMA-48:
		"   OSC - OPERATING SYSTEM COMMAND:
		"     Representation: 09/13 or ESC 05/13 (this is \033] here)
		"     OSC is used as the opening delimiter of a control string for operating system use.
		"     The command string following may consist of a sequence of bit combinations
		"     in the range 00/08 to 00/13 and 02/00 to 07/14.
		"     The control string is closed by the terminating delimiter STRING TERMINATOR (ST).
		"     The interpretation of the command string depends on the relevant operating system.
		" From :h t_SI:
		"   Added by Vim (there are no standard codes for these):
		"     t_SI start insert mode (bar cursor shape)
		"     t_EI end insert mode (block cursor shape)
		let &t_SI = "\033]12;red\007"
		let &t_EI = "\033]12;green\007"

		:silent !echo -ne "\033]12;green\007"
		autocmd VimLeave * :silent :!echo -ne "\033]12;green\007"
	endif
	" screen rajoute une couche qu'il faut percer.
	if &term =~ "screen"
		" From man screen:
		"   Virtual Terminal -> Control Sequences:
		"     ESC P  (A)  Device Control String
		"                 Outputs a string directly to the host
		"                 terminal without interpretation.
		"     ESC \  (A)  String Terminator
		let &t_SI = "\033P\033]12;red\007\033\\"
		let &t_EI = "\033P\033]12;green\007\033\\"

		:silent !echo -ne "\033P\033]12;green\007\033\\"
		autocmd VimLeave * :silent :!echo -ne "\033P\033]12;green\007\033\\"
	endif
endif

function! PhpSyntaxOverride()
	hi! def link phpDocTags  phpDefine
	hi! def link phpDocParam phpType
endfunction

augroup configgroup
	autocmd!
	autocmd VimEnter * highlight clear SignColumn
	autocmd FileType php call PhpSyntaxOverride()
	autocmd FileType yaml setlocal expandtab
	autocmd FileType json setlocal expandtab
	autocmd FileType python setlocal commentstring=#\ %s
	autocmd BufEnter *.cls setlocal filetype=java
	autocmd BufEnter *.zsh-theme setlocal filetype=zsh
	autocmd BufEnter *.lock setlocal filetype=json
	autocmd BufEnter Makefile setlocal noexpandtab
augroup END

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
	let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :", &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
	let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
	call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
" }}}

" vim: set ts=4 sw=4 tw=80 noet foldmethod=marker foldlevel=0:
