" below, set about tab for all filetype.
"set softtabstop=4
"set shiftwidth=4
"set expandtab

autocmd Filetype html setlocal sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal sts=2 sw=2 expandtab
autocmd Filetype css setlocal sts=2 sw=2 expandtab
autocmd Filetype python setlocal sts=4 sw=4 expandtab
autocmd Filetype sh setlocal sts=4 sw=4 expandtab

" next line will be auto indent.
set smartindent

" In default, ruler is on.
set ruler

set number

" set text color
set background=dark
colorscheme solarized
