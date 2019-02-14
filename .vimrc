" vim-plug (https://github.com/junegunn/vim-plug) settings {{{
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

let mapleader = ","

call plug#begin("~/.vim/plugged")

Plug 'phpactor/phpactor', {'do': 'composer install', 'branch': 'develop'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips'
Plug 'tobyS/pdv' | Plug 'tobyS/vmustache'
Plug 'mattn/emmet-vim'
Plug 'joonty/vdebug'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-repeat'
Plug 'sickill/vim-pasta'
Plug 'tmhedberg/matchit'
Plug 'rbgrouleff/bclose.vim'
Plug 'vim-scripts/colorizer'
Plug 'tpope/vim-unimpaired'
Plug 'matze/vim-move'
Plug 'vimgineers/vim-hugefile'
Plug 'kana/vim-textobj-user'
Plug 'lucapette/vim-textobj-underscore'
Plug 'jceb/vim-textobj-uri'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'chaoren/vim-wordmotion'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'airblade/vim-rooter'
Plug 'itchyny/lightline.vim'

" Syntax highlight
Plug 'jwalton512/vim-blade'
Plug 'isRuslan/vim-es6'
Plug 'pearofducks/ansible-vim'
Plug 'leafgarland/typescript-vim'
Plug 'robbles/logstash.vim'
Plug 'storyn26383/vim-vue'
Plug 'evidens/vim-twig'
Plug 'pangloss/vim-javascript'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'smerrill/vcl-vim-plugin'
Plug 'kovetskiy/sxhkd-vim'
Plug 'chr4/nginx.vim'
Plug 'stephenway/postcss.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'romainl/flattened'

" Laravel specific
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'noahfrederick/vim-composer'
Plug 'noahfrederick/vim-laravel'

if has('nvim')
	Plug 'Shougo/neomru.vim'
	Plug 'Shougo/denite.nvim'
	Plug 'ncm2/ncm2'
	Plug 'roxma/nvim-yarp'
	Plug 'phpactor/ncm2-phpactor'
	Plug 'benekastah/neomake'
	Plug 'benjie/neomake-local-eslint.vim'
else
	Plug 'shougo/unite.vim'
end

call plug#end()

filetype plugin indent on
syntax on

set background=dark
colorscheme palenight
set t_Co=256

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
set splitbelow
set splitright
set list
set listchars=tab:+\ ,eol:-
set nostartofline
set rtp+=~/.fzf
set undofile
set undolevels=1000
set undoreload=10000
set backup
set backupskip=/tmp/*,/private/tmp/*
set backupdir=~/tmp/nvim,~/.tmp,/var/tmp,/tmp
set directory=/tmp/nvim,~/.tmp,/var/tmp,/tmp
set undodir=/tmp/nvim,~/.tmp,/var/tmp,/tmp
set writebackup
set ts=4
set autoindent
set smartindent
set noexpandtab
set shiftwidth=4
set softtabstop=4
set cc=+1
set tw=80
set formatoptions-=t
set formatoptions+=j
set formatoptions+=o
set formatoptions+=r
syntax sync minlines=100

map { <Plug>(expand_region_expand)
map } <Plug>(expand_region_shrink)
map <leader>ba :bufdo bd<CR>
vnoremap > ><CR>gv
vnoremap < <<CR>gv
nnoremap <leader>t :%s/\s\+$//e<CR>:nohls<Cr>
nnoremap <leader><CR> :nohls<CR>
nnoremap <leader>bd :Bclose!<CR>
cmap w!! w !sudo tee > /dev/null %
vmap <Enter> <Plug>(EasyAlign)
vmap <s-Up> <Plug>MoveBlockUp
vmap <s-Down> <Plug>MoveBlockDown
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
nnoremap c "_c
vnoremap c "_c
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
cabbrev e <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'e ' . expand("%:p:h") : 'e')<CR>

let g:rooter_disable_map = 1
let g:rooter_patterns = ['composer.json', '.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/']

let g:neomake_php_phpmd_maker = {
	\ 'exe': 'phpmd',
	\ 'args': ['%:p', 'text', '/home/data/lsi/config/phpmd.xml'],
	\ 'errorformat': '%E%f:%l%\s%m'
\ }

let g:neomake_php_psalm_maker = {
	\ 'exe': './vendor/bin/psalm',
	\ 'args': ['--output-format=pylint', '%:p'],
	\ 'errorformat': '%E%f:%l:%m'
\ }

let g:neomake_php_enabled_makers = ['php', 'phpmd', 'psalm']
let g:neomake_open_list = 0
let g:pdv_template_dir = $HOME . "/.vim/snippets/pdv"
let g:colorizer_nomap = 1
let g:hugefile_trigger_size=10

let g:vdebug_options = {
	\ "path_maps": {
		\ "/var/www/html": "/home/data/dev.lesiteimmo",
		\ "/var/www/gedeon": "/home/data/lsi",
		\ "/var/www/Drasill": "/home/data/Drasill",
	\ },
	\ "break_on_open": 1,
	\ "watch_window_style": "compact",
	\ "port": "9000",
	\ "timeout" : 20
	\ }

let g:indentLine_char = '+'
let g:indentLine_conceallevel = 1

function! ExecuteMacroOverVisualRange()
	echo "@".getcmdline()
	execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Update PHPActor cwd each time a new buffer is accessed
function! UpdatePHPActorPath()
	let g:phpactorInitialCwd = getcwd()
endfunction

if has('nvim')
	set inccommand=split
	set shortmess+=c

	nnoremap <silent> <leader>o :<C-u>Denite buffer file_mru file_rec/git<CR>
else
	nnoremap <silent> <leader>o :<C-u>Unite buffer file_mru file<CR>
end

augroup configgroup
	autocmd!
	autocmd VimEnter *           highlight clear SignColumn
	autocmd BufEnter *.cls       setlocal filetype=java
	autocmd BufEnter *.zsh-theme setlocal filetype=zsh
	autocmd BufEnter *.lock      setlocal filetype=json
	autocmd BufEnter *.php       call UpdatePHPActorPath()
	autocmd BufEnter Makefile    setlocal noexpandtab
	autocmd FileType yaml        setlocal expandtab
	autocmd FileType json        setlocal expandtab
	autocmd FileType python      setlocal commentstring=#\ %s
	autocmd FileType python      setlocal foldmethod=syntax
	autocmd FileType php         nnoremap <leader>doc :call pdv#DocumentWithSnip()<CR>
	autocmd FileType php         noremap <Leader>u :call phpactor#UseAdd()<CR>
	autocmd FileType php         noremap <Leader>e :call phpactor#ClassExpand()<CR>
	autocmd FileType php         noremap gd :call phpactor#GotoDefinition()<CR>
	autocmd FileType php         noremap <Leader>mf :call phpactor#MoveFile()<CR>
	autocmd FileType php         noremap <Leader>cf :call phpactor#CopyFile()<CR>
	autocmd FileType php         noremap <Leader>tt :call phpactor#Transform()<CR>
	autocmd FileType php         noremap <Leader>fr :call phpactor#FindReferences()<CR>
	autocmd FileType php         noremap <Leader>mm :call phpactor#ContextMenu()<CR>
	autocmd FileType php         setlocal omnifunc=phpactor#Complete

	au FileType go nmap <leader>u <Plug>go-import
	au FileType go setlocal omnifunc=go#complete#Complete

	" Extract expression (normal mode)
	autocmd FileType php nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

	" Extract expression from selection
	autocmd FileType php vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

	" Extract method from selection
	autocmd FileType php vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
augroup END

" Will only be executed on Neovim
if has('nvim')
	" Inform Neovim to automake on new, read and write file state
	call neomake#configure#automake('rnwi')

	" Configure denite sources, aliases, vars and maps
	call denite#custom#source('file_mru', 'matchers', ['matcher_regexp'])
	call denite#custom#source('file_rec', 'matchers', ['matcher_regexp'])
	call denite#custom#source('file_rec/git', 'matchers', ['matcher_regexp'])
	call denite#custom#source('buffer', 'matchers', ['matcher_regexp'])
	call denite#custom#alias('source', 'file_rec/git', 'file_rec')
	call denite#custom#var('file_rec/git', 'command', ['git', 'ls-files', '-c', '--exclude-standard', '--recurse-submodules'])
	call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>', 'noremap')
	call denite#custom#map('insert', '<Up>', '<denite:move_to_previous_line>', 'noremap')
	call denite#custom#map('insert', '<C-]>', '<denite:jump_to_next_source>', 'noremap')
	call denite#custom#map('insert', '<C-[>', '<denite:jump_to_previous_source>', 'noremap')
	call denite#custom#var('grep', 'command', ['rg'])
	call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'final_opts', [])

	autocmd BufEnter * call ncm2#enable_for_buffer()
	set completeopt=noinsert,menuone,noselect

	" Setting up neovim-completion-manager source for PHPActor. Instead of using
	" existing plugin in order to that, just register the source using the
	" phpactor#Complete omnifunc
	au User CmSetup call cm#register_source({'name' : 'phpactor',
		\ 'priority': 9,
		\ 'scoping': 1,
		\ 'scopes': ['php'],
		\ 'abbreviation': 'php',
		\ 'word_pattern': '[$\w]+',
		\ 'cm_refresh_patterns':['-\>', '::'],
		\ 'cm_refresh': {'omnifunc': 'phpactor#Complete'},
		\ })
end

fun! <SID>StripTrailingWhitespaces()
	if match(expand('%p'), ".*horizon.*") == -1
		let l = line(".")
		let c = col(".")
		%s/\s\+$//e
		call cursor(l, c)
	endif
endfun

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
	\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
	\gvy/<C-R><C-R>=substitute(
	\escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
	\gV:call setreg('"', old_reg, old_regtype)<CR>

vnoremap <silent> # :<C-U>
	\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
	\gvy?<C-R><C-R>=substitute(
	\escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
	\gV:call setreg('"', old_reg, old_regtype)<CR>

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
