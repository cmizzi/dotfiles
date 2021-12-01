"
" Filetype config
"
augroup filetype_settings
    autocmd!
    autocmd FileType php setlocal ts=4 sw=4 sts=4 expandtab
    autocmd FileType vue setlocal ts=4 sw=4 sts=4 expandtab
    autocmd FileType html setlocal ts=2 sw=2 sts=2 expandtab
    autocmd FileType blade setlocal ts=2 sw=2 sts=2 expandtab ft=blade
    autocmd FileType css setlocal ts=2 sw=2 sts=2 expandtab
    autocmd FileType javascript setlocal ts=2 sw=2 sts=2 expandtab
    autocmd FileType javascriptreact setlocal ts=2 sw=2 sts=2 expandtab
    autocmd FileType json setlocal ts=2 sw=2 sts=2 expandtab
    autocmd FileType lua setlocal ts=2 sw=2 sts=2 expandtab
    autocmd FileType crystal setlocal ts=2 sw=2 sts=2 expandtab textwidth=80 colorcolumn=80
augroup END

augroup framework_filetype_settings
    autocmd!
    autocmd BufRead,BufNewFile *.blade.php setlocal commentstring={{--\ %s\ --}} filetype=blade
augroup END

augroup DetectIndent
   autocmd!
   autocmd BufReadPost * DetectIndent
augroup END
