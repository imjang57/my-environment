""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp.vim settings
"" check details at :help ctrlp-commands and :help ctrlp-extensions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>' "invok CtrlP by mapped key
let g:ctrlp_cmd = 'CtrlP' "invok CtrlP by command
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|vendor$',
    \ 'file': '\v\.(exe|so|dll|png|jpg|jpeg|class)$'
    \ }
" Fuzzy Finding key sequences using CtrlP
map <leader>f<CR> :CtrlPBuffer<CR>
map <leader>ff<CR> :CtrlP<CR>
map <leader>fff<CR> :CtrlP .<CR>
" Re-scan cached file list
"" Add 'g:ctrlp_use_caching = 0' to disable caching
map <leader><F5> :CtrlPClearCache<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-indent-guides settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
