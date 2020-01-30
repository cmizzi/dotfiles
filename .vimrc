" Plugins {{{
" vim-plug (https://github.com/junegunn/vim-plug) settings
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

let mapleader = ","

call plug#begin("~/.vim/plugged")

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
Plug 'tpope/vim-repeat'
Plug 'rbgrouleff/bclose.vim'
Plug 'vimgineers/vim-hugefile'
Plug 'lucapette/vim-textobj-underscore'
Plug 'kana/vim-textobj-user'
Plug 'jceb/vim-textobj-uri'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'chaoren/vim-wordmotion'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-unimpaired'
Plug 'terryma/vim-multiple-cursors'

" Syntax highlight
Plug 'pangloss/vim-javascript'
Plug 'jwalton512/vim-blade'
Plug 'pearofducks/ansible-vim'
Plug 'leafgarland/typescript-vim'
Plug 'robbles/logstash.vim'
Plug 'storyn26383/vim-vue'
Plug 'evidens/vim-twig'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'smerrill/vcl-vim-plugin'
Plug 'kovetskiy/sxhkd-vim'
Plug 'chr4/nginx.vim'
Plug 'stephenway/postcss.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'noahfrederick/vim-laravel'

" theme
Plug 'morhetz/gruvbox'

if has('nvim')
	Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
	Plug 'Shougo/neomru.vim'
	Plug 'Shougo/denite.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'benekastah/neomake'
else
	Plug 'shougo/unite.vim'
end

call plug#end()
" }}}
" Configuration {{{
filetype plugin indent on
syntax on

set background=dark
colorscheme gruvbox
set t_Co=256
set termguicolors

set ru
set runtimepath^=~/.vim/plugged/coc.nvim
set updatetime=300
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
set inccommand=nosplit
set mousehide
set mouse=a
set cursorline
set hlsearch
set incsearch
set ignorecase
set smartcase
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
set rtp+=~/.fzf
set undofile
set undolevels=1000
set undoreload=10000
set backup
set backupcopy=yes
set backupskip=/tmp/*,/private/tmp/*
set backupdir=/tmp/nvim,~/.tmp,/var/tmp,/tmp
set directory=/tmp/nvim,~/.tmp,/var/tmp,/tmp
set undodir=/tmp/nvim,~/.tmp,/var/tmp,/tmp
set writebackup
set ts=4
set autoindent
set smartindent
set noexpandtab
set shiftwidth=4
set softtabstop=4
set tw=80
set signcolumn=yes
syntax sync minlines=100
" }}}
" Global functions {{{
function! ExecuteMacroOverVisualRange()
	echo "@".getcmdline()
	execute ":'<,'>normal @".nr2char(getchar())
endfunction

fun! <SID>StripTrailingWhitespaces()
	if match(expand('%p'), ".*horizon.*") == -1
		let l = line(".")
		let c = col(".")
		%s/\s\+$//e
		call cursor(l, c)
	endif
endfun

function! CocCurrentFunction()
	return get(b:, 'coc_current_function', '')
endfunction
" }}}
" Global keyboard shortcuts {{{
vnoremap > ><CR>gv
vnoremap < <<CR>gv
nnoremap <leader>t :%s/\s\+$//e<CR>:nohls<Cr>
nnoremap <leader><CR> :nohls<CR>
nnoremap <leader>bd :Bclose!<CR>
nnoremap <Leader>p "*]p
nnoremap <Leader>P "*]P
nnoremap <Leader>y :y*<cr>
nnoremap <Leader>c ^"*c$
nnoremap <Leader>d ^"*d$
vnoremap <Leader>y "*y
vnoremap <Leader>c "*c
vnoremap <Leader>d "*d
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

let g:multi_cursor_quit_key = '<Esc>'
let g:multi_cursor_exit_from_insert_mode = 1
let g:multi_cursor_exit_from_visual_mode = 1

map <leader>ba :bufdo bd<CR>
vmap <Enter> <Plug>(EasyAlign)
cmap w!! w !sudo tee > /dev/null %

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U> let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR> gvy/<C-R><C-R>=substitute(escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR> gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U> let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR> gvy?<C-R><C-R>=substitute(escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR> gV:call setreg('"', old_reg, old_regtype)<CR>
" }}}
" Editor specific {{{
if has('nvim')
	set shortmess+=c

	" Inform Neovim to automake on new, read and write file state
	call neomake#configure#automake('rnwi')

	" Configure denite sources, aliases, vars and maps
	call denite#custom#source('file_mru', 'matchers', ['matcher_regexp'])
	call denite#custom#source('file/rec', 'matchers', ['matcher_regexp'])
	call denite#custom#source('file/rec/git', 'matchers', ['matcher_regexp'])
	call denite#custom#source('buffer', 'matchers', ['matcher_regexp'])
	call denite#custom#alias('source', 'file/rec/git', 'file/rec')

	call denite#custom#var('file/rec/git', 'command', ['git', 'ls-files', '-c', '--exclude-standard', '--recurse-submodules'])
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

	" Define mappings
	autocmd FileType denite call s:denite_my_settings()

	function! s:denite_my_settings() abort
		nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
		nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
		nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
		nnoremap <silent><buffer><expr> q denite#do_map('quit')
		nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
		nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'

		call denite#custom#option('_', {
			\ 'wincol': 0,
			\ 'winheight': 20,
			\ 'winrow': 0,
			\ 'winwidth': &columns,
		\ })
	endfunction

	call denite#custom#option('_', {
		\ 'wincol': 0,
		\ 'winheight': 20,
		\ 'winrow': 0,
		\ 'winwidth': winwidth('%'),
	\ })

	call denite#custom#option('default', {
		\ 'prompt': '❯❯❯:',
		\ 'statusline': v:false,
		\ 'highlight_matched_char': 'Underlined',
		\ 'cursor_shape': v:true,
		\ 'cursor_wrap': v:true,
		\ 'split': 'floating',
	\ })

	call denite#custom#option('list', {})
	call denite#custom#option('mpc', { 'mode': 'normal', 'winheight': 20 })

	" Specific Neovim keyboard mapping
	nnoremap <silent> <leader>o :<C-u>Denite buffer file_mru file/rec/git<CR>
else
	" Specific Vim keyboard mapping
	nnoremap <silent> <leader>o :<C-u>Unite buffer file_mru file<CR>
end
" }}}
" Plugins configurations {{{
let g:rainbow_active = 1

let g:neomake_php_phpmd_maker = {
	\ 'exe': 'phpmd',
	\ 'args': ['%:p', 'text', '/home/data/lsi/config/phpmd.xml'],
	\ 'errorformat': '%E%f:%l%\s%m'
\ }

let g:neomake_php_psalm_maker = {
	\ 'exe': 'psalm',
	\ 'args': ['--output-format=pylint', '%:p'],
	\ 'errorformat': '%E%f:%l:%m'
\ }

let g:neomake_php_enabled_makers = ['php', 'phpmd', 'psalm']
let g:neomake_open_list = 0
let g:pdv_template_dir = $HOME . "/.vim/snippets/pdv"
let g:hugefile_trigger_size=10

let g:vdebug_options = {
	\ "path_maps": {
		\ "/var/www/html": "/home/data/dev.lesiteimmo",
		\ "/var/www/gedeon": "/home/data/lsi",
		\ "/var/www/lsi": "/home/data/lsi",
		\ "/var/www/Drasill": "/home/data/Drasill",
	\ },
	\ "break_on_open": 1,
	\ "watch_window_style": "compact",
	\ "port": "9000",
	\ "timeout" : 20
	\ }

let g:indentLine_char = '+'
let g:indentLine_conceallevel = 1

let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status',
	\   'currentfunction': 'CocCurrentFunction'
	\ },
\ }
" }}}
" Groups {{{
" Syntax specific
augroup defineAutoCmd
	autocmd!

	autocmd VimEnter * highlight clear SignColumn
	autocmd BufEnter *.zsh-theme setlocal filetype=zsh
	autocmd BufEnter *.lock,.babelrc setlocal filetype=json
	autocmd BufEnter Makefile setlocal noexpandtab
	autocmd FileType yaml setlocal expandtab
	autocmd FileType html,vue setlocal nowrap
	autocmd FileType html,vue setlocal textwidth=0
	autocmd FileType html,vue setlocal wrapmargin=0
	autocmd FileType html,vue setlocal ts=4
	autocmd FileType html,vue setlocal sw=4
	autocmd FileType html,vue setlocal noexpandtab
	autocmd FileType json setlocal expandtab
	autocmd FileType python setlocal commentstring=#\ %s
	autocmd FileType python setlocal foldmethod=syntax
	autocmd FileType php nnoremap <leader>doc :call pdv#DocumentWithSnip()<CR>
	autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
augroup END

if has('nvim')
" coc.nvim specific
augroup cocx
	autocmd!

	function! s:show_documentation()
		if (index(['vim','help'], &filetype) >= 0)
			execute 'h '.expand('<cword>')
		else
			call CocAction('doHover')
		endif
	endfunction

	inoremap <silent><expr> <c-space> coc#refresh()
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

	" Use `[c` and `]c` to navigate diagnostics
	nmap <silent> [c <Plug>(coc-diagnostic-prev)
	nmap <silent> ]c <Plug>(coc-diagnostic-next)

	autocmd CursorHold * silent call CocActionAsync('highlight')
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

	" Show documentation
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	nmap <leader>rn <Plug>(coc-rename)
	vmap <leader>f <Plug>(coc-format-selected)
	nmap <leader>f <Plug>(coc-format-selected)
	vmap <leader>a <Plug>(coc-codeaction-selected)
	nmap <leader>a <Plug>(coc-codeaction-selected)
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)
	nmap <leader>ac <Plug>(coc-codeaction)
	nmap <leader>qf <Plug>(coc-fix-current)

	command! -nargs=0 Format :call CocAction('format')
	command! -nargs=? Fold :call CocAction('fold', <f-args>)
augroup END
endif
" }}}

" vim:foldmethod=marker:foldlevel=0:modelines=1
