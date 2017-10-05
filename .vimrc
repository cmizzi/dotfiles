" vim-plug (https://github.com/junegunn/vim-plug) settings {{{
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

let mapleader = ","

call plug#begin("~/.vim/plugged")

if has('nvim')
	Plug 'Shougo/denite.nvim'
	Plug 'roxma/nvim-completion-manager'
	Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
	Plug 'benekastah/neomake'
	Plug 'benjie/neomake-local-eslint.vim'
else
	Plug 'shougo/unite.vim'
end

Plug 'mhartington/oceanic-next'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Shougo/neomru.vim'
Plug 'bling/vim-airline'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips'
Plug 'tobyS/pdv' | Plug 'tobyS/vmustache'
Plug 'mattn/emmet-vim'
Plug 'joonty/vdebug'
Plug 'jwalton512/vim-blade'
Plug 'Shougo/echodoc.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'isRuslan/vim-es6'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'elzr/vim-json'
Plug 'heavenshell/vim-jsdoc'
Plug 'pearofducks/ansible-vim'
Plug 'tpope/vim-repeat'
Plug 'kchmck/vim-coffee-script'
Plug 'sickill/vim-pasta'
Plug 'tmhedberg/matchit'
Plug 'evidens/vim-twig'
Plug 'smerrill/vcl-vim-plugin'
Plug 'kovetskiy/sxhkd-vim'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'stephenway/postcss.vim'
Plug 'posva/vim-vue'
Plug 'robbles/logstash.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'kshenoy/vim-signature'
Plug 'leafgarland/typescript-vim'
Plug 'vim-scripts/colorizer'
Plug 'matze/vim-move'
Plug 'vimgineers/vim-hugefile'
Plug 'kana/vim-textobj-user'
Plug 'lucapette/vim-textobj-underscore'
Plug 'jceb/vim-textobj-uri'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'j16180339887/Global.vim'

call plug#end()

filetype plugin indent on
filetype off
syntax on

if (has("termguicolors"))
	set termguicolors
endif

set background=dark
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

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
set sw=4
set autoindent
set smartindent
set cc=+1
set tw=80
set formatoptions-=t
set formatoptions+=j
set formatoptions+=o
set formatoptions+=r

if has('nvim')
	set inccommand=split
	set shortmess+=c

	nnoremap <silent> <leader>o :<C-u>Denite buffer file_mru `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>
else
	nnoremap <silent> <leader>o :<C-u>Unite buffer file_mru file<CR>
end

cnoremap <c-A> <Home>
cnoremap <c-E> <End>
cnoremap <c-K> <C-U>
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
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
vnoremap . :norm.<CR>
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

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
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:vdebug_options = {"path_maps": {"/var/www": "/data"}, "break_on_open": 1, "watch_window_style": "compact", "port": "9001" }
let g:pdv_template_dir = $HOME . "/.vim/snippets/pdv"
let g:colorizer_nomap = 1
let g:hugefile_trigger_size=10
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
	\ 'php': ['php', '~/.composer/vendor/felixfbecker/language-server/bin/php-language-server.php'],
	\ 'javascript': ['node', '/data/cmizzi/javascript-typescript-langserver/lib/language-server-stdio.js']
	\ }

function! ExecuteMacroOverVisualRange()
	echo "@".getcmdline()
	execute ":'<,'>normal @".nr2char(getchar())
endfunction

augroup configgroup
	autocmd!
	autocmd FileType python      setlocal foldmethod=syntax
	autocmd FileType php         nnoremap <leader>doc :call pdv#DocumentWithSnip()<CR>
	autocmd FileType js          nnoremap <leader>doc <Plug>(jsdoc)
	autocmd FileType vue         nnoremap <leader>doc <Plug>(jsdoc)
	autocmd FileType php         noremap  gd :call LanguageClient_textDocument_definition()<CR>
	autocmd VimEnter *           highlight clear SignColumn
	autocmd FileType yaml        setlocal expandtab
	autocmd FileType json        setlocal expandtab
	autocmd FileType python      setlocal commentstring=#\ %s
	autocmd BufEnter *.cls       setlocal filetype=java
	autocmd BufEnter *.zsh-theme setlocal filetype=zsh
	autocmd BufEnter *.lock      setlocal filetype=json
	autocmd BufEnter Makefile    setlocal noexpandtab
	autocmd FileType vue         syntax sync fromstart
augroup END

if has('nvim')
	call neomake#configure#automake('rnw')
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
end
